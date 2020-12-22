# Dotfiles

lightdm, bspwm, sxhkd, polybar e conky.

## Dipendences

#### Lightdm

```bash
$ yay -S lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan light-locker
```

#### bspwm

```bash
$ yay -S bspwm nitrogen lxsession lxappearance wmname
```

`nitrogen` is meant to set the background every time when bspwm starts, `lxsession` will be used for polkits and `wmname` to avoid any [Java bug](https://wiki.archlinux.org/index.php/Bspwm#Problems_with_Java_applications).

#### sxhkd

```bash
$ yay -S sxhkd pamixer rofi
```

`pamixer` it is necessary to manage the audio also from the keys.

`rofi` to launch program.

#### Polybar

```bash
$ yay -S polybar bdf-unifont siji-git pamac-manager
```

In the `polybar` config file there is a custom module:

```vim
[module/archupdate]
type = custom/script

interval = 5
content-padding = 1

exec = /usr/bin/checkupdates | wc -l
label = %{A1:pamac-manager:}A: %output%%{A}
```

This is to indicate when there are updates, and possibly open `pamac-manager`. If you don't want to use pamac-manager you need to remove the module from the configration file.

#### Conky

```bash
$ yay -S conky
```

## Installation

```
.
├── bspwm
│   ├── bspwmrc
│   ├── conky
│   │   └── config
│   ├── polybar
│   │   ├── config
│   │   └── launch.sh
│   └── sxhkd
│       └── sxhkdrc
└── etc
    └── lightdm
        └── lightdm.conf
```

The bspwm folder must be copied to the ~/.config/directory

The lightdm config file must be copied to the /etc/lightdm/directory

## Tips

#### GTK3

If you have a GTK3 theme, and you want to set it to whole entire system, you have to create the file ~/.config/gtk-3.0/settings.ini:

```bash
[Settings]
gtk-icon-theme-name=Papirus-Dark
gtk-theme-name=deepin-dark
gtk-font-name=Cantarell 11
gtk-cursor-theme-name=bloom
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
```

 And also in \~/.index/default/index.theme:

```bash
[icon theme]
Inherits=bloom
```

Instead of `bloom` and `Papirus-Dark` set the themes that you prefer.
