-- TokyoNight Night colors
local colors = {
    rosewater = "ff9e64",
    flamingo  = "f7768e",
    pink      = "ff007f",
    mauve     = "bb9af3",
    red       = "f7768e",
    maroon    = "e06c75",
    peach     = "ff9e64",
    yellow    = "e0af68",
    green     = "9ece6a",
    teal      = "73daca",
    sky       = "89ddff",
    sapphire  = "2ac3de",
    blue      = "7aa2f7",
    lavender  = "b4f9f8",
    text      = "c0caf5",
    subtext1  = "a9b1d6",
    subtext0  = "9abc52",
    overlay2  = "787c99",
    overlay1  = "565f89",
    overlay0  = "414868",
    surface2  = "3b4261",
    surface1  = "2f3549",
    surface0  = "24283b",
    base      = "1a1b26",
    mantle    = "16161e",
    crust     = "101014",
}

-- Автоматически создаём переменные для Hyprland
for name, hex in pairs(colors) do
    _G[name] = hex
    _G[name .. "Alpha"] = hex
    _G[name .. "Alphaff"] = hex .. "ff"
end
