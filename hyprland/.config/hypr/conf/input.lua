local touchpad_on = { name = "gxtp7863:00-27c6:01e0-touchpad", enabled = true }
local touchpad_off = { name = "gxtp7863:00-27c6:01e0-touchpad", enabled = false }

hl.config({
  input = {
    kb_layout  = "us,ru",
    kb_variant = "",
    kb_model   = "",
    kb_options = "grp:caps_toggle",
    kb_rules   = "",

    follow_mouse = 1,

    accel_profile = "adaptive",
    sensitivity = 0.2, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = true,         -- Натуральный скролл (контент за пальцем)
      clickfinger_behavior = true,   -- Клики: 2 пальца = ПКМ, 3 пальца = СКМ
      scroll_factor = 0.5,          -- Скорость скролла (убавь, если скроллит дико быстро)
      disable_while_typing = true,   -- Защита от случайных касаний ладонью
      tap_to_click = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

hl.gesture({
  fingers = 3,
  direction = "down",
  action = "close"
})


hl.device(touchpad_on)
