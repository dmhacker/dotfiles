# dotfiles

<a><img src="https://raw.githubusercontent.com/dmhacker/dankfiles/master/Pictures/screenshot.jpg" align="center"></a>

**Configuration files for my main workstation.** I'm running Arch Linux on a 13" Surface Book 2.

## Dependencies

* [i3-gaps](https://github.com/Airblader/i3) <sub>window manager</sub>
* [glitchlock](https://github.com/xero/glitchlock/) <sub>i3 locking mechanism</sub>
* [polybar](https://github.com/jaagr/polybar) <sub>improved status bar</sub>
* [compton](https://github.com/chjj/compton) <sub>window compositor</sub>
* [rofi](https://github.com/DaveDavenport/rofi) <sub>replacement for dmenu</sub>
* [ranger](https://github.com/ranger/ranger) <sub>file manager with vim bindings</sub>
* [redshift](https://github.com/jonls/redshift) <sub>flux for Arch Linux</sub>
* [termite](https://github.com/thestinger/termite/) <sub>terminal emulator</sub>
* [xfce4-terminal](https://git.xfce.org/apps/xfce4-terminal/) <sub>terminal emulator for my RPI 3</sub>
* [powerline-shell](https://github.com/b-ryan/powerline-shell) <sub>fancy terminal prompt</sub>
* [nerd-fonts-complete](https://github.com/ryanoasis/nerd-fonts) <sub>patched fonts for powerline</sub>
* [vundle](https://github.com/VundleVim/Vundle.vim) <sub>vim package manager</sub>
* [shadowfox-updater](https://github.com/overdodactyl/ShadowFox) <sub>completely dark UI for Firefox</sub>

## Miscellaneous

Some of the packages are Arch-specific, but there are probably other variants/ways to 
acquire them if you are using a different distribution. I would also recommend following 
[this guide](https://reddit.com/r/archlinux/comments/5r5ep8/make_your_arch_fonts_beautiful_easily/) 
to set up fonts for your target environment.

Another thing to note is that while I am using the i3 window manager, I'm also using KDE 
Plasma 5 and SDDM in conjunction with i3. This gives me a fallback desktop environment and 
a nice login screen (so that I don't have to `xstart` i3 everytime). I'd recommend replacing 
Plasma/SDDM's default font with something a bit more aesthetic (e.g. Source Sans Pro). 

Previously, I was also using rxvt-unicode as my main terminal emulator. However, urxvt would
not cooperate with any 256-color schemes that I used on vim. Because of that, I switched to
termite, which happens to be functionally similar to urxvt. I've left my urxvt configuration
files intact for the time being, although they will eventually be phased out.
