swayimg.mode = "viewer"
swayimg.antialiasing = true
swayimg.decoration = false
swayimg.overlay = false

swayimg.imagelist.order = "alpha"
swayimg.imagelist.reverse = false
swayimg.imagelist.recursive = false
swayimg.imagelist.adjacent = false
swayimg.imagelist.fsmon = true

swayimg.text.font = "monospace"
swayimg.text.size = 28
swayimg.text.color = 0xffcccccc
swayimg.text.background = 0x00000000
swayimg.text.shadow = 0xd0000000
swayimg.text.padding = 10
swayimg.text.timeout = 5
swayimg.text.status_timeout = 3
swayimg.text.visible = false

swayimg.viewer.default_scale = "fit"
swayimg.viewer.default_position = "center"
swayimg.viewer.set_window_background(0x00000000)
swayimg.viewer.set_image_chessboard(20, 0xff333333, 0xff4c4c4c)
swayimg.viewer.loop = true
swayimg.viewer.history = 1
swayimg.viewer.preload = 1

swayimg.slideshow.timeout = 3
swayimg.slideshow.default_scale = "fit"
swayimg.slideshow.set_window_background("auto")

swayimg.gallery.thumb_size = 200
swayimg.gallery.cache = 100
swayimg.gallery.preload = false
swayimg.gallery.pstore = false
swayimg.gallery.aspect = "fill"
swayimg.gallery.window_color = 0x00000000
swayimg.gallery.unselected_color = 0xff202020
swayimg.gallery.selected_color = 0xff404040
swayimg.gallery.border_color = 0xff000000

swayimg.viewer.on_key("F1", function()
  swayimg.text.set_status("Help: см. документацию swayimg")
end)
swayimg.viewer.on_key("Left", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_key("Right", function() swayimg.viewer.switch_image("next") end)
swayimg.viewer.on_key("Space", function() swayimg.exit() end)
swayimg.viewer.on_key("Escape", function() swayimg.exit() end)

local function step_image(dx, dy)
  local pos = swayimg.viewer.get_position()
  local wnd = swayimg.get_window_size()
  swayimg.viewer.set_abs_position(pos.x + dx * wnd.width / 20, pos.y + dy * wnd.height / 20)
end
swayimg.viewer.on_mouse("ScrollLeft", function() step_image(5, 0) end)
swayimg.viewer.on_mouse("ScrollRight", function() step_image(-5, 0) end)
swayimg.viewer.on_mouse("ScrollUp", function() step_image(0, -5) end)
swayimg.viewer.on_mouse("ScrollDown", function() step_image(0, 5) end)

swayimg.viewer.on_mouse("Ctrl-ScrollUp", function()
  local pos = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.get_scale()
  swayimg.viewer.set_abs_scale(scale * 1.1, pos.x, pos.y)
end)
swayimg.viewer.on_mouse("Ctrl-ScrollDown", function()
  local pos = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.get_scale()
  swayimg.viewer.set_abs_scale(scale * 0.9, pos.x, pos.y)
end)

swayimg.viewer.on_mouse("Shift-ScrollUp", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_mouse("Shift-ScrollDown", function() swayimg.viewer.switch_image("next") end)
swayimg.viewer.on_mouse("Alt-ScrollUp", function() swayimg.viewer.prev_frame() end)
swayimg.viewer.on_mouse("Alt-ScrollDown", function() swayimg.viewer.next_frame() end)

swayimg.viewer.on_mouse("MouseSide", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_mouse("MouseExtra", function() swayimg.viewer.switch_image("next") end)

swayimg.slideshow.on_key("F1", function() swayimg.text.set_status("Help: slideshow") end)
swayimg.slideshow.on_key("Home", function() swayimg.viewer.switch_image("first") end)
swayimg.slideshow.on_key("End", function() swayimg.viewer.switch_image("last") end)
swayimg.slideshow.on_key("Prior", function() swayimg.viewer.switch_image("prev") end)
swayimg.slideshow.on_key("Next", function() swayimg.viewer.switch_image("next") end)
swayimg.slideshow.on_key("Shift+r", function() swayimg.viewer.switch_image("random") end)
swayimg.slideshow.on_key("Shift+d", function() swayimg.viewer.switch_image("prev_dir") end)
swayimg.slideshow.on_key("d", function() swayimg.viewer.switch_image("next_dir") end)
swayimg.slideshow.on_key("Space", function() swayimg.viewer.set_animation() end)
swayimg.slideshow.on_key("i", function() swayimg.text.show() end)
swayimg.slideshow.on_key("f", function() swayimg.set_fullscreen() end)

swayimg.viewer.on_key("Return", function()
    local img = swayimg.viewer.get_image()
    if img and img.path then
        local name = img.path:match("([^/]+)$") or img.path
        print(name)
        swayimg.exit()
    end
end)
swayimg.slideshow.on_key("Escape", function() swayimg.exit() end)
swayimg.slideshow.on_key("q", function() swayimg.exit() end)

swayimg.gallery.on_key("F1", function() swayimg.text.set_status("Help: gallery") end)
swayimg.gallery.on_key("Home", function() swayimg.gallery.switch_image("first") end)
swayimg.gallery.on_key("End", function() swayimg.gallery.switch_image("last") end)
swayimg.gallery.on_key("Left", function() swayimg.gallery.switch_image("left") end)
swayimg.gallery.on_key("Right", function() swayimg.gallery.switch_image("right") end)
swayimg.gallery.on_key("Up", function() swayimg.gallery.switch_image("up") end)
swayimg.gallery.on_key("Down", function() swayimg.gallery.switch_image("down") end)
swayimg.gallery.on_key("Prior", function() swayimg.gallery.switch_image("pgup") end)
swayimg.gallery.on_key("Next", function() swayimg.gallery.switch_image("pgdown") end)
swayimg.gallery.on_key("c", function() swayimg.gallery.switch_image("next") end)
swayimg.gallery.on_key("s", function() swayimg.set_mode("slideshow") end)
swayimg.gallery.on_key("f", function() swayimg.set_fullscreen() end)
swayimg.gallery.on_key("Return", function() swayimg.set_mode("viewer") end)
swayimg.gallery.on_key("a", function() swayimg.antialiasing = not swayimg.antialiasing end)
swayimg.gallery.on_key("r", function() swayimg.viewer.reload() end)
swayimg.gallery.on_key("i", function() swayimg.text.show() end)
swayimg.gallery.on_key("Equal", function() end)
swayimg.gallery.on_key("Plus", function() end)
swayimg.gallery.on_key("Minus", function() end)
swayimg.gallery.on_key("Shift-Delete", function()
  local image = swayimg.gallery.get_image()
  if image then
    os.remove(image.path)
    swayimg.text.set_status("File removed: " .. image.path)
    swayimg.gallery.switch_image("right")
  end
end)
swayimg.gallery.on_key("Escape", function() swayimg.exit() end)
swayimg.gallery.on_key("q", function() swayimg.exit() end)

swayimg.gallery.on_mouse("ScrollLeft", function() swayimg.gallery.switch_image("right") end)
swayimg.gallery.on_mouse("ScrollRight", function() swayimg.gallery.switch_image("left") end)
swayimg.gallery.on_mouse("ScrollUp", function() swayimg.gallery.switch_image("up") end)
swayimg.gallery.on_mouse("ScrollDown", function() swayimg.gallery.switch_image("down") end)
swayimg.gallery.on_mouse("Ctrl-ScrollUp", function() end)
swayimg.gallery.on_mouse("Ctrl-ScrollDown", function() end)

swayimg.gallery.on_mouse("MouseLeft", function() swayimg.set_mode("viewer") end)
