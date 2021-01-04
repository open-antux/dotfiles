# Dotfiles

lightdm, dwm, e polybar-dwm-module.

## Dipendenze

#### Lightdm

```bash
$ yay -S lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan light-locker numlockx
```

#### dwm

```bash
$ yay -S nitrogen lxsession lxappearance wmname picom rofi
```

`nitrogen` ha lo scopo di impostare lo sfondo ogni volta all'avvio di bspwm, `lxsession` verrà utilizzato per i polkit e `wmname` per evitare evenutali [bug di Java](https://wiki.archlinux.org/index.php/Bspwm#Problems_with_Java_applications). È necessario inoltre compilare e installare [dwmipcpp](https://github.com/mihirlad55/dwmipcpp) per il funzionamento della polybar su dwm.

Fatto ciò, si può compilare dwm:
```bash
dotfiles/dwm/dwm $ sudo make install
```
#### Polybar

```bash
$ yay -S polybar-dwm-module bdf-unifont siji-git 
```

## Installazione

```
├── .config
│   └── dwm
│       ├── autostart.sh
│       ├── picom
│       │   └── picom.conf
│       └── polybar
│           ├── bar.sh
│           └── config
├── dwm
│   ├── config.def.h
│   ├── config.h
│   ├── config.mk
│   ├── drw.c
│   ├── drw.h
│   ├── drw.o
│   ├── dwm
│   ├── dwm.1
│   ├── dwm.c
│   ├── dwm-msg
│   ├── dwm-msg.c
│   ├── dwm-msg.o
│   ├── dwm.o
│   ├── ipc.c
│   ├── IPCClient.c
│   ├── IPCClient.h
│   ├── ipc.h
│   ├── layouts.c
│   ├── LICENSE
│   ├── Makefile
│   ├── transient.c
│   ├── util.c
│   ├── util.h
│   ├── util.o
│   ├── yajl_dumps.c
│   └── yajl_dumps.h
└── etc
    └── lightdm
        ├── lightdm.conf
        └── lightdm-webkit2-greeter.conf
```

Copiare i file nelle rispettive cartelle (i file in .config vanno messi nella tua home/.config).

## Consigli

#### GTK3

Se si ha un tema GTK3, e lo si vuole impostare per l'intero sistema, bisogna creare il file ~/.config/gtk-3.0/settings.ini:

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

E anche in ~/.index/default/index.theme:

```bash
[icon theme]
Inherits=bloom
```

Al posto di `bloom` e `Papirus-Dark` mettere i temi che più si preferiscono.
