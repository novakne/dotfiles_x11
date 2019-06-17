# Dotfiles

*Dotfiles managed with [yadm](https://yadm.io)*

## Table of contents

* [Infos](#infos)
* [Screenshots](#screenshots)
* [Shell](#shell)
    + [Plugins](#plugins)
    + [Cli Tools](#cli-tools)
    + [Directory](#directory)
        - [~/.zsh/](#zsh)
        - [~/bin/](#bin)
* [Wallpaper](#wallpaper)

## Infos

 _                | _
--                | --|
**OS**            | Arch Linux
**WM**            | [Bspwm](https://github.com/baskerville/bspwm)
**Shell**         | Zsh
**Terminal**      | [Alacritty](https://github.com/jwilm/alacritty)
**Panel**         | [Polybar](https://github.com/jaagr/polybar)
**Files manager** | [Nnn](https://github.com/jarun/nnn) / Thunar
**Launcher**      | [Rofi](https://github.com/davatorium/rofi)
**Editor**        | [Neovim](https://github.com/neovim/neovim)
**Browser**       | Vivaldi / Firefox
**Music Player**  | Mpd / Ncmpcpp
**Video Player**  | [Mpv](https://github.com/mpv-player/mpv)
**Image Viewer**  | [Sxiv](https://github.com/muennich/sxiv)
**Terminal Font** | [Monoid Nerd Font](https://github.com/ryanoasis/nerd-fonts) / [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts)
**System Font**   | [Overpass](https://overpassfont.org) / [Inter](https://github.com/rsms/inter)
**Icons**         | [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) modified with [Oomox](https://github.com/themix-project/oomox)
**Gtk Theme**     | [Materia](https://github.com/nana-4/materia-theme) modified with [Oomox](https://github.com/themix-project/oomox)

## Screenshots


![neofetch](img/previews/neofetch.png?raw=true "neofetch")
*fzf & neofetch & ncmpcpp*

![nvim](img/previews/nvim_md.png?raw=true "nvim & vivaldi")
*neovim & vivaldi*

![nvim](img/previews/nvim.png?raw=true "nvim")
*neovim and my theme aize.vim, with ALE, Coc.nvim, Vista.vim*

![clean](img/previews/clean.png?raw=true "clean")
*clean*

## Shell ( Zsh )

![colors](img/previews/colors.png?raw=true "shell colors")
![prompt](img/previews/prompt.png?raw=true "prompt")

### Plugins

Lazy loaded with [Zplugin](https://github.com/zdharma/zplugin)

* [zsh-async](https://github.com/mafredri/zsh-async)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)

### Cli Tools

* [nnn](https://github.com/jarun/nnn) - File manager ( `$HOME/.config/nnn/plugins/` )
    * `browse_img` Browse images in sxiv
    * `browse_img_full` Browse images in sxiv in fullscreen
    * `edit` Open file in a running neovim instance with neovim-remote if possible
    * `fuzzy` Fuzzy find file with fzf and open in nvim
    * `open` Fuzzy find with fzf and open with xdg-open
    * `pdfview` View pdf in terminal
    * `set_wal` Set wallpaper with nitrogen
* [fzf](https://github.com/junegunn/fzf) - Cli fuzzy finder ( `$HOME/.zsh/functions/` )
    * `fapps` Open apps
    * `fcd` Interactive `cd`
    * `fcdh` Interactive `cd` with hidden files
    * `fe` Open file in vscode
    * `frg` Fuzzy grep with ripgrep and open in nvim
    * `fimg` Open images in sxiv
    * `fj` Fzf integration with autojump
    * `fkill` Kill processes
    * `fpkg` Search installed packages
    * `fv` Open file in the default editor
    * `fvid` Open videos in mpv
* [ripgrep](https://github.com/BurntSushi/ripgrep) - Recursively searches directories for a regex pattern
* [bat](https://github.com/sharkdp/bat) - A cat clone with wings
* [exa](https://github.com/ogham/exa) - A modern version of ‘ls
* [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to 'find'
* [autojump](https://github.com/wting/autojump) - A cd command for easily navigate directories

### Directory

#### ~/.zsh/

* **functions/** - Load functions only when you call them
    * `br` Open images dir with sxiv `br path/`
    * `extract` Extract archives
    * `jn` Jump to a directory with autojump and open it in neovim
    * `man` Colored man pages
    * `mcd` mkdir and cd to new dir
    * `n` nnn cd on quit with `Ctl-g`
    * `up` Go up N dir `up 2`
* **options/** Zsh settings

#### ~/bin/

*User scripts*

* **bar/** - Lemonbar config ( old, I don't use it rigth now )
    * `bar_config` General config
    * `popup_config` Popup style bar
    * `popup_exit` Poweroff/Reboot/etc... menu
    * `popup_info` Clock, battery, wifi...
    * `popuup_music` Music from mpd
    * `popup_workspaces` Bspwm workspace
* **colors/** - Scripts to show colors in the terminal
* `arch_maint` Multiple command to help maintain arch
* `brightness_notif` Send a notif when changing screen brightness
* `fetch` Show basic system infos
* `mdpdf` Convert markdown to pdf with [Pandoc](https://github.com/jgm/pandoc)
* `neof` Clear terminal and launch neofetch
* `nv` Neovim development prerelease build app.image
* `nwrap` Launch nnn
* `pkg_list` Backup a list of installed package
* `power_menu` Open a exit menu in rofi
* `snap` Take screenshot with [maim](https://github.com/naelstrof/maim)
* `sxhkd_key` Show sxkhd mappings in fzf
* `update_mirror` Get a list of fatest french mirror

## Wallpaper

[Wallpaper original by Oskar Woinski](https://www.artstation.com/artwork/vPBmE)

![Modified](img/previews/wal.jpg?raw=true "wallpaper")
My modified version
