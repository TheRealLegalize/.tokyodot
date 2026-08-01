home = os.getenv("HOME") -- Убрали local

-- shell = 'qs -c noctalia-shell '
shell = 'noctalia msg '
------------------
---- Noctalia ----
------------------

-- menu = shell .. 'panel-toggle launcher'
-- clipboard = shell .. 'panel-toggle clipboard'
-- wpp = shell .. 'panel-toggle wallpaper'
-- newWpp = shell .. 'panel-toggle noctalia/wallhaven:browser'

volumeUp = shell .. 'volume-up 5'
volumeDown = shell .. 'volume-down 5'
mute = shell .. 'volume-mute'
mediaNext = shell .. 'media next'
mediaPrev = shell .. 'media previous'
mediaToggle = shell .. 'media toggle'
brightUp = shell .. 'brightness-up 5'
brightDown = shell .. 'brightness-down 5'




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
