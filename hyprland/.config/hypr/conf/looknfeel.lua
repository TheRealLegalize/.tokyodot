---@diagnostic disable: assign-type-mismatch
-- Hyprland 0.55 Look & Feel

hl.config({
  general = {
    gaps_in = gaps_in,
    gaps_out = gaps_out,
    border_size = border_size,
    col = {
      active_border   = "rgb(" .. accent .. ")",
      inactive_border = "rgb(" .. inactive .. ")",
    },
    resize_on_border = false,
    allow_tearing    = true,
    layout           = "dwindle",

  },

  decoration = {
    rounding       = rounding,
    rounding_power = rounding_power,
    border_part_of_window = true,
    -- dim_inactive = false,
    -- dim_strength = 0.2,

    shadow = {
      enabled      = shadow.enabled,
      range        = shadow.range,
      render_power = shadow.render_power,
      color        = shadow.color,
    },

    blur = {
      enabled          = blur.enabled,
      special          = blur.special_workspace,
      xray             = blur.xray,
      size             = blur.size, --10
      passes           = blur.passes, -- 3
      new_optimizations = true,
      ignore_opacity   = false,
      vibrancy         = 0.1696,
    },

  },

  animations = {
    enabled = animations.enabled,
    workspace_wraparound = animations.workspace_wraparound
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
hl.animation({ leaf = "windows",          enabled = true, speed = anim_speed, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = anim_speed, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = anim_speed, bezier = "md3_accel", style = "popin 60%" })
hl.animation({ leaf = "fade",             enabled = true, speed = anim_speed, bezier = "md3_decel" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = anim_speed_workspace, bezier = "menu_decel", style = "slidefade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = anim_speed, bezier = "md3_decel", style = "slidevert -100%" })

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
