# Dotfiles

*Dotfiles managed with [yadm](https://yadm.io)*

## Table of contents

* [Infos](#infos)
* [Screenshots](#screenshots)
* [AwesomeWM](#awesomewm)
* [Shell](#shell)
    + [Plugins](#plugins)
    + [Cli Tools](#cli-tools)
    + [Directory](#directory)
        - [~/.zsh/](#zsh)
        - [~/bin/](#bin)
* [Wallpaper](#wallpaper)

## Infos


* `OS_` Arch Linux
* `WM_` [AwesomeWM](https://github.com/awesomeWM/awesome) ( *git master branch* )
  * `acpi` needed in battery widget
* `Shell_` Zsh

### Applications
* `Browser_` Vivaldi / Firefox
* `Editor_` [Neovim 5.x](https://github.com/neovim/neovim) ( *prerelease build* )
* `Files manager_` [Nnn](https://github.com/jarun/nnn) / Thunar
* `Launcher_` [Rofi](https://github.com/davatorium/rofi) ( *git master branch* )
* `Media_`
  * `Image_` [Sxiv](https://github.com/muennich/sxiv)
  * `Music_` Mpd / Ncmpcpp / Spotify
  * `Video_` [Mpv](https://github.com/mpv-player/mpv)
* `Screenshot_` [Maim](https://github.com/naelstrof/maim)
* `Terminal_` [Alacritty](https://github.com/jwilm/alacritty)
* `Fonts_`
  * `System_` [Inter](https://github.com/rsms/inter)
  * `Terminal_` [Custom Iosevka build Nerd Font](https://github.com/be5invis/iosevka)
* `Theme_`
  * `Icons_` [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) modified with [Oomox](https://github.com/themix-project/oomox)
  * `Gtk_` [Materia](https://github.com/nana-4/materia-theme) modified with [Oomox](https://github.com/themix-project/oomox)

## Screenshots


![clean](img/previews/clean.png?raw=true "clean")
*clean desktop with rofi*

![dirty](img/previews/dirty.png?raw=true "dirty")
*neovim & nnn & fetch*

## AwesomeWM

( **WIP** )

### File structure

* **configuration/** - Options from the default `rc.lua` splited and arrange into several files
* **icons/** - Icons for all themes
* **layout/** - Panels and app launcher ( rofi )
* **themes/** - Decorations
* **utils/** - Contains all the reuse code, functions, etc...
* **widgets/** - All widgets
* *rc.lua* -  main configuration file


## Shell ( Zsh )

![colors](img/previews/colors.png?raw=true "shell colors")
![prompt](img/previews/prompt.png?raw=true "prompt")

### Plugins

Lazy loaded with [Zinit](https://github.com/zdharma/zinit)

* [zsh-async](https://github.com/mafredri/zsh-async)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)

### Cli Tools

* [nnn](https://github.com/jarun/nnn) - Files manager ( `$HOME/.config/nnn/plugins/` )
    * `beautify` Replace 'space' and '-' in file/dir name with '_' and convert to lowercase
    * `browse_img` Browse images in `sxiv`
    * `browse_img_full` Browse images in `sxiv` in fullscreen
    * `edit` Open file in a running `neovim` instance with `neovim-remote` if possible
    * `exec` Exec a script
    * `fuzzy` Fuzzy find file with `fzf` and open in default editor
    * `launch` GUI application launcher
    * `open` Fuzzy find with `fzf` and open with `xdg-open`
    * `open_term` Open a new instance of `Alacritty` in current dir
    * `pdfview` View pdf in terminal
    * `set_wal` Set wallpaper with `nitrogen`
    * `suedit` Edit in default editor with sudo
* [fzf](https://github.com/junegunn/fzf) - Cli fuzzy finder ( `$HOME/.zsh/functions/` )
    * `fapps` Open apps
    * `fcd` Interactive `cd`
    * `fcdh` Interactive `cd` with hidden files
    * `fe` Open file in default editor
    * `fimg` Open images in `sxiv`
    * `fkill` Kill processes
    * `fpkg` Search installed packages
    * `frg` Fuzzy grep with `ripgrep` and open in default editor
    * `fvid` Open videos in `mpv`
* [ripgrep](https://github.com/BurntSushi/ripgrep) - Recursively searches directories for a regex pattern
* [bat](https://github.com/sharkdp/bat) - A cat clone with wings
* [exa](https://github.com/ogham/exa) - A modern version of ls
* [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to 'find'
* [z.lua](https://github.com/skywind3000/z.lua) - A new cd command that helps you navigate faster by learning your habits

### Directory

#### ~/.zsh/

* **completions** - User auto completions for some cli tools
* **functions/** - Load functions only when you call them
    * `br` Open images dir with sxiv `(br path/)`
    * `extract` Extract archives
    * `man` Colored man pages
    * `mcd` mkdir and cd to new dir
    * `n` `nnn` cd on quit with `Ctl-g`
    * `up` Go up N dir `(up 2)`
    * `zn` Jump to a directory with `z.lua` and open it in `neovim`
* **options/** Zsh settings

#### ~/bin/

*User scripts*

* **colors/** - Scripts to show colors in the terminal
* `arch_maint` Multiple command to help maintain arch **(WIP)**
* `brightness_notif` Send a notif when changing screen brightness
* `fetch` Show basic system infos
* `mdpdf` Convert markdown to pdf with [Pandoc](https://github.com/jgm/pandoc)
* `neof` Clear terminal and launch neofetch
* `nwrap` Launch `nnn`
* `pkg_list` Backup a list of installed package
* `power_menu` Open a exit menu in `rofi`
* `rm_shit.py` Remove some trash in $HOME
* `snap` Take screenshot with [maim](https://github.com/naelstrof/maim)
* `sxhkd_key` Show `sxkhd` mappings in `fzf`
* `update_mirror` Get a list of fatest french mirror

