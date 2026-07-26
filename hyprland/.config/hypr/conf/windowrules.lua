-- ==================== WINDOW RULES (Hyprland 0.55 Lua) ====================

local termClass = "kitty"
local username = os.getenv("USER") or os.getenv("USERNAME")


-- Thunar
local confirmReplace = hl.window_rule({
  match = {
    class = "^([Tt]hunar)$",
    title = "^(Confirm to replace files)$"
  },
  float = true
})

local renameFile = hl.window_rule({
  match = {
    class = "^([Tt]hunar)$",
    title = "^(Rename .*)$"
  },
  float = true
})

local fileOperationProgress = hl.window_rule({
  match = {
    class = "^([Tt]hunar)$",
    title = "^(File Operation Progress)$"
  },
  float = true,
  size = {456, 102}
})

thunarTransparency = hl.window_rule({
  match = {
    class = "^([Tt]hunar)$",
    title = "^(.* - [Tt]hunar)$"
  },
  opacity = "0.9 0.8"
})

local thunarBase = hl.window_rule({
  match = {
    class = "^([Tt]hunar)$",
    title = "^(.* - [Tt]hunar)$"
  },
  float = true,
  size = {1280, 720},
  center = true,
  border_size = 2,
  xray = true,
  no_shadow = true
})

local fileProperties = hl.window_rule({
  match = {
    class = "^([Tt]hunar)$",
    title = "^(.* - [Pp]roperties)$"
  },
  float = true,
  max_size = {624, 568}
})

-- Terminal (kitty)
local kittyFloatTerm = hl.window_rule({
  match = {
    class = "^(" .. termClass .. ")$",
    title = "^(floatterm)$"
  },
  float = true,
  size = {1280, 800},
  center = true
})

local kittyWallpaper = hl.window_rule({
  match = {
    class = "^(" .. termClass .. ")$",
    title = "^(wallpaper)$"
  },
  float = true,
  center = true,
  size = {874, 874}
})

-- MPV
local mpvBase = hl.window_rule({
  match = {
    class = "^(mpv)$"
  },
  float = true,
  border_size = 0,
  max_size = {1280, 720}
})

-- Swayimg
local swayimgBase = hl.window_rule({
  match = {
    class = "^(swayimg)$"
  },
  float = true,
  no_blur = true,
  no_shadow = true,
  center = true,
  border_size = 0,
  max_size = {1280, 720}
})

-- Zen
local zenBase = hl.window_rule({
  match = {
    class = "^(zen)$"
  },
  border_size = 0
})

local zenExtension = hl.window_rule({
  match = {
    class = "^(zen)$",
    title = "^(Extension:*)$"
  },
  float = true,
  size = {450, 615}
})

-- LibreWolf
local librewolfBase = hl.window_rule({
  match = {
    class = "^(librewolf)$"
  },
  opacity = "0.95 0.9",
  no_shadow = true
})

-- Nwg-look
local nwgLookBase = hl.window_rule({
  match = {
    class = "^(nwg-look)$"
  },
  float = true,
  size = {714, 473}
})

-- Gimp
local gimpFilePng = hl.window_rule({
  match = {
    class = "^(file-png)$"
  },
  float = true,
  center = true,
  size = {646, 526}
})

-- Calendar
local gsimplecalBase = hl.window_rule({
  match = {
    class = "^(gsimplecal)$"
  },
  move = {1150, 60}
})

-- Satty
local sattyBase = hl.window_rule({
  match = {
    class = "^(com.gabm.satty)$"
  },
  float = true,
  center = true
})

-- Other
local yandexMusicModBase = hl.window_rule({
  match = {
    class = "^(YandexMusicMod)$"
  },
  float = false,
  fullscreen = false,
  workspace = 5,
  center = true,
  -- max_size = {1440, 900},
  size = {1440, 900}
})

local qbittorrentBase = hl.window_rule({
  match = {
    class = "^(org.qbittorrent.qBittorrent)$"
  },
  float = true
})

local globalSuppressMaximize = hl.window_rule({
  match = {
    class = ".*"
  },
  suppress_event = "maximize"
})

local xwaylandNoFocus = hl.window_rule({
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    fullscreen = false
  },
  no_focus = true
})

local arkBase = hl.window_rule({
  match = {
    class = "^(org.kde.ark)$"
  },
  float = true
})

local xdgDesktopPortalGtkBase = hl.window_rule({
  match = {
    class = "^(xdg-desktop-portal-gtk)$"
  },
  float = true,
  center = true,
  size = {720, 500}
})

local telegramSaveFile = hl.window_rule({
  match = {
    class = "^(Telegram)$",
    title = "^(Save File)$"
  },
  center = true
})

telegramBase = hl.window_rule(({
  match = {
    class = "^(.*ayugram.*)$"
  },
  -- float = false,
  -- center = false,
  -- size = {650, 1025},
--  opacity = "0.8 0.7"
}))

local nyarchBase = hl.window_rule(({
  match = {
    class = "^(org.kde.dolphin)$"
  },
  float = true,
  center = true,
  size = {1280, 800},
--  opacity = "0.8 0.7"
}))

local portProtonBase = hl.window_rule({
  match = {
    class = "^(PortProton)$"
  },
  float = true,
  suppress_event = "activateFocus",
  workspace = 6,
  center = false
})

local portProtonExe = hl.window_rule({
  match = {
    class = "^(.*.exe)$"
  },
  suppress_event = "activateFocus",
  workspace = 6,
  no_blur = true,
  border_size = 0
})

local waydroidBase = hl.window_rule({
  match = {
    class = "^(Waydroid)$"
  },
  float = true,
  size = {1280, 720}
})

local timeshiftBase = hl.window_rule({
  match = {
    class = "^(timeshift-gtk)$"
  },
  float = true,
  max_size = {1280, 720}
})

-- ==================== LAYER RULES ====================

local wofiLayer = hl.layer_rule({
  match = {
    namespace = "wofi"
  },
  blur = true,
  xray = true
})

local waybarLayer = hl.layer_rule({
  match = {
    namespace = "waybar"
  },
  blur = true,
  xray = true
})

local waybarLayer = hl.layer_rule({
  match = {
    namespace = "noctalia-shell:regionSelector"
  },
  no_anim = true,
})

local waybarLayer = hl.layer_rule({
  match = {
    namespace = "slurp"
  },
  no_anim = true,
})



waybarLayer:set_enabled(true)
