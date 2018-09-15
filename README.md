# dotfiles

<a><img src="https://raw.githubusercontent.com/dmhacker/dankfiles/master/Pictures/screenshot.jpg" align="center"></a>

**Configuration files for my main workstation.** I'm running Arch Linux on a 13" Surface Book 2.

## Dependencies

* [i3-gaps](https://github.com/Airblader/i3) [window manager]
* [glitchlock](https://github.com/xero/glitchlock/) [i3 locking mechanism]
* [polybar](https://github.com/jaagr/polybar) [improved status bar]
* [compton](https://github.com/chjj/compton) [window compositor]
* [rofi](https://github.com/DaveDavenport/rofi) [replacement for dmenu]
* [ranger](https://github.com/ranger/ranger) [file manager with vim bindings]
* [redshift](https://github.com/jonls/redshift) [flux for Arch Linux]
* [termite](https://github.com/thestinger/termite/) [terminal emulator]
* [xfce4-terminal](https://git.xfce.org/apps/xfce4-terminal/) [terminal emulator for my RPI 3]
* [powerline-shell](https://github.com/b-ryan/powerline-shell) [fancy terminal prompt]
* [nerd-fonts-complete](https://github.com/ryanoasis/nerd-fonts) [patched fonts for powerline]
* [vundle](https://github.com/VundleVim/Vundle.vim) [vim package manager]
* [shadowfox-updater](https://github.com/overdodactyl/ShadowFox) [completely dark UI for Firefox]

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
