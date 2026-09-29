-- ==== Toggles & values ====

anim_speed = 3
anim_speed_workspace = 6

gaps_in = 2
gaps_out = 6

border_size = 2

rounding = 0
rounding_power = 4

keyboard_toggle = "grp:caps_toggle"

monitor = {
  resolution = "2560x1440",
  refresh_rate = "60"
}

shadow = {
  enabled = true,
  range = 4,
  render_power = 3,
  color = "rgba(" .. text .. "08)"
}

blur = {
  enabled = true,
  special_workspace = false,
  xray = true,
  size = 4,
  passes = 4,
  -- variant = "acrylic" -- disabled till implemented in non git
}

animations = {
  enabled = true,
  workspace_wraparound = false
}
