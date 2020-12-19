# Dotfiles

lightdm, bspwm, sxhkd, polybar e conky.

## Dipendenze

#### Lightdm

```bash
$ yay -S lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan
```

There is a [bug](https://bugs.archlinux.org/task/68905?project=5&string=light-locker) with `light-locker` which prevents you from returning to the previous session after locking, so I recommend to downgrade to version 1.9.0-2:

```bash
$ sudo pacman -U https://archive.archlinux.org/packages/l/light-locker/light-locker-1.9.0-2-x86_64.pkg.tar.zst
```

#### bspwm

```bash
$ yay -S bspwm nitrogen lxsession wmname
```

`nitrogen` is meant to set the background every time when bspwm starts,` lxsession` will be used for polkits and `wmname` to avoid any [Java bug](https://wiki.archlinux.org/index .php/Bspwm#Problems_with_Java_applications).

#### sxhkd

```bash
$ yay -S sxhkd pamixer
```

`pamixer` it is necessary to manage the audio also from the keys.

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

## Installazione

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


