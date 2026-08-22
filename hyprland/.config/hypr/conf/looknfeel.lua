-- Hyprland 0.55 Look & Feel

require("./../colors/mocha")   -- подключаем цвета

hl.config({
  general = {
    gaps_in = 2, -- 2
    gaps_out = 5, -- 5
    border_size = 2, -- 3
    col = {
      active_border   = "rgba(" .. blueAlphaff .. ")",
      inactive_border = "rgba(" .. surface0Alphaff .. ")",
    },
    resize_on_border = false,
    allow_tearing    = true,
    layout           = "dwindle",

  },

  decoration = {
    rounding       = 0, -- 5, -- 10
    rounding_power = 4,
    active_opacity   = 1,
    inactive_opacity = 1,
    dim_inactive = true,
    dim_strength = 0.4,
    border_part_of_window = false,

    shadow = {
      enabled      = false,
      range        = 4,
      render_power = 3,
      color        = "rgba(ffffff08)",
    },

    blur = {
      enabled          = true,
      special          = false,
      xray             = true,
      size             = 3, --8
      passes           = 3,
      new_optimizations = true,
      ignore_opacity   = true,
      vibrancy         = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})

-- Curves (bezier)
hl.curve("linear",        { type = "bezier", points = {{0,0},   {1,1}} })
hl.curve("md3_standard",  { type = "bezier", points = {{0.2,0},{0,1}} })
hl.curve("md3_decel",     { type = "bezier", points = {{0.05,0.7},{0.1,1}} })
hl.curve("md3_accel",     { type = "bezier", points = {{0.3,0},{0.8,0.15}} })
hl.curve("overshot",      { type = "bezier", points = {{0.05,0.9},{0.1,1.1}} })
hl.curve("crazyshot",     { type = "bezier", points = {{0.1,1.5},{0.76,0.92}} })
hl.curve("hyprnostretch", { type = "bezier", points = {{0.05,0.9},{0.1,1.0}} })
hl.curve("menu_decel",    { type = "bezier", points = {{0.1,1},{0,1}} })
hl.curve("menu_accel",    { type = "bezier", points = {{0.38,0.04},{1,0.07}} })
hl.curve("easeInOutCirc", { type = "bezier", points = {{0.85,0},{0.15,1}} })
hl.curve("easeOutCirc",   { type = "bezier", points = {{0,0.55},{0.45,1}} })
hl.curve("easeOutExpo",   { type = "bezier", points = {{0.16,1},{0.3,1}} })
hl.curve("softAcDecel",   { type = "bezier", points = {{0.26,0.26},{0.15,1}} })
hl.curve("md2",           { type = "bezier", points = {{0.4,0},{0.2,1}} })

-- Animations
hl.animation({ leaf = "windows",          enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 3, bezier = "md3_accel", style = "popin 60%" })
hl.animation({ leaf = "border",           enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade",             enabled = true, speed = 3, bezier = "md3_decel" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert -100%" })

hl.config({
  master = { new_status = "master" },
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo   = true,
    font_family = "Caskaydia Cove Nerd Font",
    animate_manual_resizes = true,
    animate_mouse_windowdragging = true,
    single_window_aspect_ratio = {4, 3},
  },
})


hl.config({
  cursor = {
    persistent_warps = true,
  },
})
