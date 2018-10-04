#!/usr/bin/env python3

import json
import pprint
import crcmod

from argparse import ArgumentParser

from pathlib import Path

import serial
from serial import Serial

DEFAULT_DEVICE = '/dev/ttyS0'
CRC_FN = crcmod.predefined.mkCrcFun('crc-ccitt-false')
DEBUG = False

def setup_device(port):
    # definition from DSDT
    return Serial(
        port=port,
        baudrate=3000000,
        bytesize=serial.EIGHTBITS,
        parity=serial.PARITY_NONE,
        stopbits=serial.STOPBITS_ONE,
        rtscts=False,
        dsrdtr=False,
        timeout=0,
    )


def crc(pld):
    x = CRC_FN(bytes(pld))
    return [x & 0xff, (x >> 0x08) & 0xff]


def to_int(bytes):
    return int.from_bytes(bytes, byteorder='little')


class Counters:
    PATH = Path(__file__).parent / '.counters.json'

    @staticmethod
    def load():
        if Counters.PATH.is_file():
            with open(Counters.PATH) as fd:
                data = json.load(fd)
                seq = data['seq']
                cnt = data['cnt']
        else:
            seq = 0x00
            cnt = 0x0000

        return Counters(seq, cnt)

    def __init__(self, seq, cnt):
        self.seq = seq
        self.cnt = cnt

    def store(self):
        with open(Counters.PATH, 'w') as fd:
            data = {'seq': self.seq, 'cnt': self.cnt}
            json.dump(data, fd)

    def inc_seq(self):
        self.seq = (self.seq + 1) & 0xFF

    def inc_cnt(self):
        self.cnt = (self.cnt + 1) & 0xFFFF

    def inc(self):
        self.inc_seq()
        self.inc_cnt()


class Command:
    def __init__(self, rtc, riid, rcid):
        self.rtc = rtc
        self.riid = riid
        self.rcid = rcid

    def _write_msg(self, dev, seq, cnt):
        cnt_lo = cnt & 0xff
        cnt_hi = (cnt >> 0x08) & 0xff

        hdr = [0x80, 0x08, 0x00, seq]
        pld = [0x80, self.rtc, 0x01, 0x00, self.riid, cnt_lo, cnt_hi, self.rcid]
        msg = [0xaa, 0x55] + hdr + crc(hdr) + pld + crc(pld)

        return dev.write(bytes(msg))

    def _write_ack(self, dev, seq):
        hdr = [0x40, 0x00, 0x00, seq]
        msg = [0xaa, 0x55] + hdr + crc(hdr) + [0xff, 0xff]

        return dev.write(bytes(msg))

    def _read_ack(self, dev, exp_seq):
        msg = bytes()
        while len(msg) < 0x0A:
            msg += dev.read(0x0A - len(msg))

        if DEBUG:
            print("received: {}".format(msg.hex()))

        assert msg[0:2] == bytes([0xaa, 0x55])
        assert msg[3:5] == bytes([0x00, 0x00])
        assert msg[6:8] == bytes(crc(msg[2:-4]))
        assert msg[8:] == bytes([0xff, 0xff])

        mty = msg[2]
        seq = msg[5]

        if mty == 0x40:
            assert seq == exp_seq

        return mty == 0x04

    def _read_msg(self, dev, cnt):
        cnt_lo = cnt & 0xff
        cnt_hi = (cnt >> 0x08) & 0xff

        buf = bytes()
        rem = 0x08                          # begin with header length
        while len(buf) < rem:
            buf += dev.read(0x0200)

            # if we got a header, validate it
            if rem == 0x08 and len(buf) >= 0x08:
                hdr = buf[0:8]

                assert hdr[0:3] == bytes([0xaa, 0x55, 0x80])
                assert hdr[-2:] == bytes(crc(hdr[2:-2]))

                rem += hdr[3] + 10          # len(payload) + frame + crc

        if DEBUG:
            print("received: {}".format(buf.hex()))

        hdr = buf[0:8]
        msg = buf[8:hdr[3]+10]

        assert msg[0:8] == bytes([0x80, self.rtc, 0x00, 0x01, self.riid, cnt_lo, cnt_hi, self.rcid])
        assert msg[-2:] == bytes(crc(msg[:-2]))

        seq = hdr[5]
        pld = msg[8:-2]

        return seq, pld

    def run(self, dev, cnt):
        self._write_msg(dev, cnt.seq, cnt.cnt)
        retry = self._read_ack(dev, cnt.seq)

        # retry one time on com failure
        if retry:
            self._write_msg(dev, cnt.seq, cnt.cnt)
            retry = self._read_ack(dev, cnt.seq)

            if retry:
                print('Communication failure: invalid ACK, try again')
                return

        try:
            seq, pld = self._read_msg(dev, cnt.cnt)
            self._write_ack(dev, seq)
        finally:
            cnt.inc()

        return self._handle_payload(pld)

    def _handle_payload(self, pld):
        return None


class Gbos(Command):
    def __init__(self):
        super().__init__(0x11, 0x00, 0x0d)

    def _handle_payload(self, pld):
        return {
            'Base Status': hex(pld[0]),
        }


class Psr(Command):
    def __init__(self, bat):
        super().__init__(0x02, bat, 0x0d)

    def _handle_payload(self, pld):
        return {
            'Power Source': hex(to_int(pld[0:4])),
        }


class Sta(Command):
    def __init__(self, bat):
        super().__init__(0x02, bat, 0x01)

    def _handle_payload(self, pld):
        return {
            'Battery Status': hex(to_int(pld[0:4])),
        }


class Bst(Command):
    def __init__(self, bat):
        super().__init__(0x02, bat, 0x03)

    def _handle_payload(self, pld):
        return {
            'State': hex(to_int(pld[0:4])),
            'Present Rate': hex(to_int(pld[4:8])),
            'Remaining Capacity': hex(to_int(pld[8:12])),
            'Present Voltage': hex(to_int(pld[12:16])),
        }


class Bix(Command):
    def __init__(self, bat):
        super().__init__(0x02, bat, 0x02)

    def _handle_payload(self, pld):
        return {
            'Revision': hex(pld[0]),
            'Power Unit': hex(to_int(pld[1:5])),
            'Design Capacity': hex(to_int(pld[5:9])),
            'Last Full Charge Capacity': hex(to_int(pld[9:13])),
            'Technology': hex(to_int(pld[13:17])),
            'Design Voltage': hex(to_int(pld[17:21])),
            'Design Capacity of Warning': hex(to_int(pld[21:25])),
            'Design Capacity of Low': hex(to_int(pld[25:29])),
            'Cycle Count': hex(to_int(pld[29:33])),
            'Measurement Accuracy': hex(to_int(pld[33:37])),
            'Max Sampling Time': hex(to_int(pld[37:41])),
            'Min Sampling Time': hex(to_int(pld[41:45])),
            'Max Averaging Interval': hex(to_int(pld[45:49])),
            'Min Averaging Interval': hex(to_int(pld[49:53])),
            'Capacity Granularity 1': hex(to_int(pld[53:57])),
            'Capacity Granularity 2': hex(to_int(pld[57:61])),
            'Model Number': pld[61:82].decode().rstrip('\0'),
            'Serial Number': pld[82:93].decode().rstrip('\0'),
            'Type': pld[93:98].decode().rstrip('\0'),
            'OEM Information': pld[98:119].decode().rstrip('\0'),
        }


class PrettyBat:
    def __init__(self, bat):
        self.bix = Bix(bat)
        self.bst = Bst(bat)

    def run(self, dev, cnt):
        bix = self.bix.run(dev, cnt)
        dev.reset_input_buffer()
        bst = self.bst.run(dev, cnt)

        state = int(bst['State'], 0)
        vol = int(bst['Present Voltage'], 0)
        rem_cap = int(bst['Remaining Capacity'], 0)
        full_cap = int(bix['Last Full Charge Capacity'], 0)
        rate = int(bst['Present Rate'], 0)

        bat_state = ['None', 'Discharging', 'Charging'][state]
        bat_vol = vol / 1000
        bat_rem_perc = int(rem_cap / full_cap * 100)

        if state == 0x00 or rate == 0:
            bat_rem_life = '<unavailable>'
        else:
            bat_rem_life = "{:.2f}h".format(rem_cap / rate)

        return {
            'State': bat_state,
            'Voltage': "{}V".format(bat_vol),
            'Percentage': "{}%".format(bat_rem_perc),
            'Remaining': bat_rem_life,
            'Current Capacity': rem_cap,
            'Full Capacity': full_cap
        }


COMMANDS = {
    'lid0.gbos': Gbos(),
    'adp1._psr': Psr(0x01),
    'bat1._sta': Sta(0x01),
    'bat1._bst': Bst(0x01),
    'bat1._bix': Bix(0x01),
    'bat2._sta': Sta(0x02),
    'bat2._bst': Bst(0x02),
    'bat2._bix': Bix(0x02),
    'bat1.pretty': PrettyBat(0x01),
    'bat2.pretty': PrettyBat(0x02),
}


def main():
    cli = ArgumentParser(description='Surface Book 2 / Surface Pro (2017) embedded controller requests.')
    cli.add_argument('-d', '--device', default=DEFAULT_DEVICE, metavar='DEV', help='the UART device')
    cli.add_argument('-c', '--cnt', type=lambda x: int(x, 0), help='overwrite CNT')
    cli.add_argument('-s', '--seq', type=lambda x: int(x, 0), help='overwrite SEQ')

    args = cli.parse_args()

    dev = setup_device(args.device)

    cmd1 = COMMANDS.get('bat1.pretty')
    cmd2 = COMMANDS.get('bat2.pretty')

    cnt = Counters.load()
    if args.seq is not None:
        cnt.seq = args.seq
    if args.cnt is not None:
        cnt.cnt = args.cnt

    try:
        res1 = cmd1.run(dev, cnt)
        res2 = cmd2.run(dev, cnt)
        percentage = (res1['Current Capacity'] + res2['Current Capacity']) / (res1['Full Capacity'] + res2['Full Capacity']) * 100
        if res1['State'] == 'Charging': 
            print("  {0:.0f}%".format(percentage))
        else:
            if percentage < 10:
                print("  {0:.0f}%".format(percentage))
            elif percentage < 37:
                print("  {0:.0f}%".format(percentage))
            elif percentage < 63:
                print("  {0:.0f}%".format(percentage))
            elif percentage < 90:
                print("  {0:.0f}%".format(percentage))
            else: 
                print("  {0:.0f}%".format(percentage))
    finally:
        cnt.store()


if __name__ == '__main__':
    main()
