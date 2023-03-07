# polybar-cmus

Basic cmus module for polybar

[Ray](https://github.com/raytruong): /u/WozarZ's cmus script, but I cleaned up issues relating to capturing artist 
name and string dump when no track is running.

Me: Added that script can now 'echo' if the player is in shuffle or/and repeat_current mode.

## Installation

```language
$ git clone https://github.com/gontoblez/polybar-cmus
$ cd polybar-cmus
$ chmod +x cmus.sh
$ mv cmus.sh /path/to/polybar/config
```
And finally, add the following to your [polybar](https://github.com/polybar/polybar) `config`:

```ini
[module/cmus]
type = custom/script

exec = ~/.config/polybar/cmus.sh
exec-if = pgrep -x cmus
interval = 1

click-left = cmus-remote --next
click-right = cmus-remote --prev
click-middle = cmus-remote --pause
scroll-up = cmus-remote --volume +5%
scroll-down = cmus-remote --volume -5%

label-font = 3
format = <label>
format-underline = ${colors.foreground-alt}
label = %output%
label-maxlen = 50
```
