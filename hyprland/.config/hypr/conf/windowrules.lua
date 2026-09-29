-- ==================== WINDOW RULES (Hyprland 0.55 Lua) ====================

local termClass = "kitty"
local username = os.getenv("USER") or os.getenv("USERNAME")

local global = hl.window_rule({
  match = {
    class = "^(.*)"
  },
  no_shadow = true,
})

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

local thunarOpacity = hl.window_rule({
  match = {
    class = "^([Tt]hunar)$"
  },
  opacity = 0.70
})

local xdgOpacity = hl.window_rule({
  match = {
    class = "^(xdg-desktop-portal-gtk)"
  },
  opacity = 0.70
})

local thunarBase = hl.window_rule({
  match = {
    class = "^([Tt]hunar)$",
    title = "^(.* - [Tt]hunar)$"
  },
  float = true,
  size = {1280, 720},
  center = true,
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

local kittyMain = hl.window_rule({
  match = {
    class = "^(" .. termClass .. ")$",
  },
  no_blur = false
})


local kittyFloatTerm = hl.window_rule({
  match = {
    class = "^(floatterm)$",
  },
  float = true,
  size = {1280, 720},
  center = true
})

local kittyDropdown = hl.window_rule({
  match = {
    class = "^(dropdown-kitty)$",
  },
  float = true,
  size = {"2048", "720"},
  move = {"256", "46"},
  animation = "slide top",
  border_size = 0,
  no_shadow = false
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

local ffplayBase = hl.window_rule({
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

-- Noctalia
local noctaliaSettings = hl.window_rule({
  match = {
    class = "^(dev.noctalia.Noctalia)$",
    title = "^(Noctalia Settings)$",
  },
  float = true,
  opacity = 0.7,
  center = true,
  size = {1280, 1100}
})


-- Zen
local zenBase = hl.window_rule({
  match = {
    class = "^(zen)$"
  },
  -- border_size = 2
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
  -- opacity = "0.95 0.9",
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
local gimpFile = hl.window_rule({
  match = {
    class = "^(file-.*)$"
  },
  float = true,
  center = true,
  size = {1280, 720}
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
  size = {1440, 900},
  opacity = 0.8
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

local telegramBase = hl.window_rule(({
  match = {
    class = "^(.*ayugram.*)$"
  },
  float = true,
  center = true,
  size = {720, 1324},
  opacity = "0.7"
}))


local portProtonBase = hl.window_rule({
  match = {
    class = "^(PortProton)$"
  },
  float = true,
  workspace = 6,
  center = false
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

local heliumUnmaximize = hl.window_rule({
  match = {
  class = "^(chrome-.*)$"
  },
  suppress_event = "maximize fullscreen fullscreenoutput"
})

-- ==================== LAYER RULES ====================

local slurpLayer = hl.layer_rule({
  match = {
    namespace = ".*"
  },
  no_anim = true,
  blur = false
})

for i = 1, 6 do
hl.workspace_rule({
---@diagnostic disable-next-line: assign-type-mismatch
    workspace = i,
    persistent = true
})
end
