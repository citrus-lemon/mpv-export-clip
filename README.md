# mpv-export-clip

a mpv lua script to cut clips from video

## How to use

```sh
mkdir -p ~/.config/mpv/scripts
git clone https://github.com/WindProphet/mpv-export-clip ~/.config/mpv/scripts/mpv-export-clip
```

and register function

add this to `~/.config/mpv/input.conf`

```
Ctrl+2 script-message export-loop-clip
a script-message seek-ab-loop-a
b script-message seek-ab-loop-b
Ctrl+a script-message set-ab-loop-a
Ctrl+b script-message set-ab-loop-b
# add following for moving pointer faster
Alt+RIGHT frame-step
Alt+LEFT frame-back-step
```

clip will be saved in `screenshot-directory` folder

## Roadmap

- [x] generate video clip from ab-loop
- [ ] record clip time info into a file and able to recover
- [ ] build an interface for browsing clips and useful operations
