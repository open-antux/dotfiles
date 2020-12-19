# Dotfiles

lightdm, bspwm, sxhkd, polybar e conky.

## Dipendenze

#### Lightdm

```bash
$ yay -S lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan
```

C'è un [bug](https://bugs.archlinux.org/task/68905?project=5&string=light-locker) con `light-locker` che impedisce di ritornare alla sessione precedente dopo il lock, per tanto consiglio di fare il downgrade alla versione 1.9.0-2:

```bash
$ sudo pacman -U https://archive.archlinux.org/packages/l/light-locker/light-locker-1.9.0-2-x86_64.pkg.tar.zst
```

#### bspwm

```bash
$ yay -S bspwm nitrogen lxsession wmname
```

`nitrogen` ha lo scopo di impostare lo sfondo ogni volta all'avvio di bspwm, `lxsession` verrà utilizzato per i polkit e `wmname` per evitare evenutali [bug di Java](https://wiki.archlinux.org/index.php/Bspwm#Problems_with_Java_applications)

#### sxhkd

```bash
$ yay -S sxhkd pamixer
```

`pamixer` è necessario per gestire l'audio anche dai tasti.

#### Polybar

```bash
$ yay -S polybar bdf-unifont siji-git pamac-manager
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

La cartella bspwm, deve essere copiata nella directory \~/.config/

Il file config di lightdm, deve essere copiati nella directory /etc/lightdm/
