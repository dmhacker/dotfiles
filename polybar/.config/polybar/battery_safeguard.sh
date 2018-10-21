sleep 3
pkill -9 -f ~/.config/polybar/battery.py

if [ $? -eq 0 ]; then
  touch ~/.config/polybar/.battery_error
fi
