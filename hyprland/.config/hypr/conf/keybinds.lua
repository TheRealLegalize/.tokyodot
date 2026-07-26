package.path = package.path .. ";/home/user/.config/hypr/conf/?.lua"
local funcs = require("funcs")

local mainMod = "SUPER"

-- === БИНДЫ С ПЕРЕМЕННЫМИ ===
-- Используем + и правильные вызовы hl.dsp
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(floatTerminal))
hl.bind(mainMod .. " + ALT + RETURN", function()
  funcs.spawnFloatWithSlurp(terminal)
end)
hl.bind(mainMod .. "  + W", hl.dsp.workspace.toggle_special("spec"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + SHIFT + R", function ()
--   if funcs.process_exists("waybar") then
--     os.execute("pkill -SIGUSR2 waybar")
--   else
--     os.execute("waybar & disown")
--   end
-- end)

hl.bind("ALT + SHIFT + S", hl.dsp.pass({window = "class:^(com\\.obsproject\\.Studio)$"}))
-- hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(home .. "/.bin/clipboard"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(wpp))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(sOutSel))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.center())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(mainMenu))

-- === ОСНОВНЫЕ БИНДЫ ===
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(0))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("$HOME/.bin/powerMenu"))
hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd('sh "$HOME/.bin/symbolMenu"'))
hl.bind("ALT + SHIFT + H", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind("ALT + SHIFT + W", hl.dsp.exec_cmd([[hyprctl activewindow | awk -F': ' '/class:/ {print $2}' | tee >( xargs | wl-copy) | xargs notify-send "Window Class:"]]))

hl.bind("ALT + SHIFT + Delete", hl.dsp.exec_cmd("~/.bin/toggleTouchpad"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("~/.bin/resMenu"))

-- Навигация и перемещение
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- hl.bind(mainMod .. " + H", hl.dsp.window.move({ direction = "l" }))
-- hl.bind(mainMod .. " + J", hl.dsp.window.move({ direction = "d" }))
-- hl.bind(mainMod .. " + K", hl.dsp.window.move({ direction = "u" }))
-- hl.bind(mainMod .. " + L", hl.dsp.window.move({ direction = "r" }))

-- === Исправленный блок ресайза (теперь точно таблицей) ===
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }),  { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 30, relative = true }),  { repeating = true })-- === ВОРКСПЕЙСЫ ===

for i = 1, 6 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- === МЕДИА ===
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volumeUp), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volumeDown), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(mute), { locked = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(mediaNext),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(mediaToggle), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(mediaToggle), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(mediaPrev),   { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(brightUp), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(brightDown), { locked = true })

-- Скриншоты
hl.bind("ALT + Print",   hl.dsp.exec_cmd(selTxt))
hl.bind("CTRL + Print",  hl.dsp.exec_cmd(screen .. " -s"))
hl.bind("Print",         hl.dsp.exec_cmd(screen))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(screen .. " -f"))

-- Мышь
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"), { locked = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"), { locked = true })
-- hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true })
--
-- hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
--
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl --class=backlight set +5%"), { locked = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl --class=backlight set 5%-"), { locked = true })
