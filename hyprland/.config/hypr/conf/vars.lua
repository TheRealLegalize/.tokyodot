home = os.getenv("HOME") -- Убрали local

shell = 'qs -c noctalia-shell '

------------------
---- Noctalia ----
------------------
menu = shell .. 'ipc call launcher toggle'
clipboard = shell .. 'ipc call launcher clipboard'
wpp = shell .. 'ipc call wallpaper toggle'

volumeUp = shell .. 'ipc call volume increase'
volumeDown = shell .. 'ipc call volume decrease'
mute = shell .. 'ipc call volume muteOutput'
mediaNext = shell .. 'ipc call media next'
mediaPrev = shell .. 'ipc call media previous'
mediaToggle = shell .. 'ipc call media playPause'
brightUp = shell .. 'ipc call brightness increase'
brightDown = shell .. 'ipc call brightness decrease'




---------------------
---- MY PROGRAMS ----
---------------------

terminal      = "kitty"
floatTerminal = "kitty -T 'floatterm'"
-- floatTerminal = home .. "/.bin/sFloat kitty"
tmuxTerminal  = [[kitty -e zsh -c "tmux new-session -A -s 0"]]
fileManager   = "thunar"
-- menu          = "wofi --show drun"
browser       = "zen-browser"
pallete       = home .. "/.bin/.palette"
mainMenu      = home .. "/.bin/mainMenu"
-- clipboard     = [[cliphist list | sed 's/^[ \t]*//' | wofi --dmenu --prompt='Clipboard' | cliphist decode | wl-copy]]


-----------------
---- SCRIPTS ----
-----------------

screen         = 'sh ' .. home .. '/.bin/prtScrn'
selTxt         = 'sh "' .. home .. '/.bin/selTxt"'
-- wpp            = 'sh "' .. home .. '/.bin/chWpp"'
rwpp           = 'sh "' .. home .. '/.bin/randWpp"'
sOutSel        = 'sh "' .. home .. '/.bin/sOutSel"'
