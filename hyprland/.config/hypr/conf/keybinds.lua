package.path = package.path .. ";/home/user/.config/hypr/conf/?.lua"
local funcs = require("funcs")

local mainMod = "SUPER"

-- ==== Noctalia ==== -- 

hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(shell .. 'settings-toggle'))
hl.bind(mainMod .. " + X",         hl.dsp.exec_cmd(shell .. 'panel-toggle session'))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(shell .. 'panel-toggle wallpaper'))
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd(shell .. 'panel-toggle launcher'))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(shell .. 'panel-toggle clipboard'))
hl.bind(mainMod .. " + ALT   + W", hl.dsp.exec_cmd(shell .. 'panel-toggle noctalia/wallhaven:browser'))

-- ==== Scripts ==== --

hl.bind(mainMod .. " + Period",       hl.dsp.exec_cmd('sh "$HOME/.bin/symbolMenu"'))
hl.bind("ALT + SHIFT + Delete",       hl.dsp.exec_cmd('~/.bin/toggleTouchpad'))
hl.bind("ALT + SHIFT + H",       hl.dsp.exec_cmd('noctalia msg bar-toggle'))
hl.bind(mainMod .. " + O",            hl.dsp.exec_cmd('~/.bin/resMenu'))
hl.bind(mainMod .. " + ALT + RETURN", function() funcs.spawnFloatWithSlurp(terminal) end)

-- ==== Variables ==== --

hl.bind(mainMod .. " + RETURN",         hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(floatTerminal))
-- hl.bind(mainMod .. " + SHIFT + K",      hl.dsp.exec_cmd("noctalia msg panel-toggle kenn/keybind-cheatsheet:cheatsheet"))
hl.bind(mainMod .. " + E",              hl.dsp.exec_cmd(fileManager))
hl.bind("ALT + SHIFT + S",      hl.dsp.exec_cmd(sOutSel))
hl.bind(mainMod .. " + SPACE",          hl.dsp.exec_cmd(mainMenu))


-- ==== Programs ===== --

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + T",         hl.dsp.exec_cmd("AyuGram"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd(browser))


-- ==== Dispathers ==== --

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.center())
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Q",         hl.dsp.window.close())
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))

-- ==== Windows control ==== --

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }),  { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 30, relative = true }),  { repeating = true })

-- ==== Workspaces ==== --

for i = 1, 6 do
  hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind("F12", hl.dsp.workspace.toggle_special("dropdown"))

-- ==== Media ==== --

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volumeUp), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volumeDown), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(mute), { locked = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(mediaNext),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(mediaToggle), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(mediaToggle), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(mediaPrev),   { locked = true })

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(brightUp), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(brightDown), { locked = true })

hl.bind("ALT + Print",   hl.dsp.exec_cmd(selTxt))
if hl.plugin.hyprcapture then
  hl.bind("Print",         function() hl.plugin.hyprcapture.open() end)
  hl.bind(mainMod .. "+ SHIFT + S",         function() hl.plugin.hyprcapture.open() end)
end
-- hl.bind("SHIFT + Print", function() hl.plugin.hyprcapture.open("fullscreen") end)
-- hl.bind("CTRL + Print",  hl.dsp.exec_cmd(screen .. " -s"))
-- hl.bind("Print",         hl.dsp.exec_cmd(screen))
-- hl.bind("SHIFT + Print", hl.dsp.exec_cmd(screen .. " -f"))

-- ==== Mouse ==== --

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
