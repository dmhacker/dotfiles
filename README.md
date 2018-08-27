# dotfiles

<a><img src="https://raw.githubusercontent.com/dmhacker/dankfiles/master/Pictures/screenshot.jpg" align="center"></a>

**Configuration files for my main workstation.** I'm running Arch Linux on a 13" Surface Book 2.

## Dependencies

* i3-gaps [window manager]
* betterlockscreen [pretty i3 locking mechanism]
* polybar [improved status bar]
* compton [window compositor]
* rofi [replacement for dmenu]
* ranger [file manager with vim bindings]
* redshift [flux for Arch Linux]
* termite [terminal emulator]
* ~~rxvt-unicode [terminal emulator]~~
* ~~urxvt-perls-git [clipboard and vim key bindings for the terminal]~~
* ~~urxvt-resize-font-git [key bindings for resizing fonts]~~
* powerline-shell [fancy terminal prompt]
* nerd-fonts-complete [patched fonts for powerline]
* adobe-source-sans-pro-fonts [UI font for i3, SDDM, KDE, polybar]
* adobe-source-code-pro-fonts [terminal font with powerline symbols]
* adobe-source-serif-pro-fonts [completes the Adobe font suite]
* vundle [vim package manager]
* shadowfox-updater [completely dark UI for Firefox]

## Miscellaneous

Some of the packages are Arch-specific, but there are probably other variants/ways to 
acquire them if you are using a different distribution. I would also recommend following 
[this guide](https://reddit.com/r/archlinux/comments/5r5ep8/make_your_arch_fonts_beautiful_easily/) 
to set up fonts for your target environment.

Another thing to note is that while I am using the i3 window manager, I'm also using KDE 
Plasma 5 and SDDM in conjunction with i3. This gives me a fallback desktop environment and 
a nice login screen (so that I don't have to `xstart` i3 everytime). I'd recommend replacing 
Plasma/SDDM's default font (Hack) with something a bit more aesthetic (e.g. Source Sans Pro). 

Previously, I was also using rxvt-unicode as my main terminal emulator. However, urxvt would
not cooperate with any 256-color schemes that I used on vim. Because of that, I switched to
termite, which happens to be functionally similar to urxvt. I've left my urxvt configuration
files intact for the time being, although they will eventually be phased out.
