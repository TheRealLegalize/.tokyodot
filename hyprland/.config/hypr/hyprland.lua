require("colors.void-spectra")

-- ==== Imports =====
local modules = {
  "colors.void-spectra",
  "settings",
  "conf.autostart",
  "conf.env",
  "conf.input",
  "conf.keybinds",
  "conf.looknfeel",
  "conf.monitors",
  "conf.windowrules",
  "conf.plugins.dynamic-cursor",
  "conf.plugins.hyprcapture",
}

for _, module in ipairs(modules) do
    require(module)
end
