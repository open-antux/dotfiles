# Dotfiles

lightdm, bspwm, sxhkd, polybar e conky.

## Dipendenze

#### Lightdm

```bash
$ yay -S lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan light-locker numlockx
```

#### bspwm

```bash
$ yay -S bspwm nitrogen lxsession lxappearance wmname picom
```

`nitrogen` ha lo scopo di impostare lo sfondo ogni volta all'avvio di bspwm, `lxsession` verrà utilizzato per i polkit e `wmname` per evitare evenutali [bug di Java](https://wiki.archlinux.org/index.php/Bspwm#Problems_with_Java_applications)

#### sxhkd

```bash
$ yay -S sxhkd pamixer albert
```

`pamixer` è necessario per gestire l'audio anche dai tasti.

##### Albert Launcher

`albert` è un applicazione per lanciare i programmi. Ha bisogno di una particolare configurazione per integrarsi (ed essere visivamente apprezzabile) con bspwm.
Consiglio di tenere abilitate nella sezione "User Interface" le seguenti opzioni:

- Display icons

- Always center Albert

- Always on top

- Hide on focus out

#### Polybar

```bash
$ yay -S polybar bdf-unifont siji-git pamac-all
```

Nel config file di `polybar` c'è un modulo personalizzato:

```vim
[module/archupdate]
type = custom/script

interval = 5
content-padding = 1

exec = /usr/bin/checkupdates | wc -l
label = %{A1:pamac-manager:}A: %output%%{A}
```

Questo serve per indicare quando ci sono aggiornamenti, ed eventualmente aprire `pamac-manager`. Se non si vuole usare pamac-manager è necessario rimuovere il modulo dal file di configruazione.

#### Conky

```bash
$ yay -S conky
```

## Installazione

```
.
├── .config
│   └── bspwm
│       ├── bspwmrc
│       ├── conky
│       │   └── config
│       ├── picom.conf
│       ├── polybar
│       │   ├── config
│       │   └── launch.sh
│       └── sxhkd
│           └── sxhkdrc
└── etc
    └── lightdm
        ├── lightdm.conf
        └── lightdm-webkit2-greeter.conf
```

La cartella bspwm, deve essere copiata nella directory \~/.config/

Il file config di lightdm, deve essere copiati nella directory /etc/lightdm/

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
