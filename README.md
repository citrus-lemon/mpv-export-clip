# mpv-export-clip

a mpv script for clipping movie

## How to use

```sh
mkdir -p ~/.config/mpv/scripts
wget https://raw.githubusercontent.com/WindProphet/mpv-export-clip/master/export_clip.lua -O ~/.config/mpv/scripts/export_clip.lua
```

and register function

add this to `~/.config/mpv/input.conf`

```
Ctrl+2 script-message export-loop-clip
# add following for moving pointer faster
Alt+RIGHT frame-step
Alt+LEFT frame-back-step
```

clip will be saved in `screenshot-directory` folder
