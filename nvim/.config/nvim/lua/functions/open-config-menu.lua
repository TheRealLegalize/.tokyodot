local function open_config_menu()
  local configs = {
    { key = "k", name = "󰄛  Kitty Config", cmd = "e ~/.config/kitty/kitty.conf"  },
    { key = "h", name = "  Hyprland Modules", cmd = "Telescope find_files cwd=~/.config/hypr" },
    { key = "n", name = "  Neovim Config", cmd = "Telescope find_files cwd=~/.config/nvim" },
    { key = "f", name = "  Fish Config", cmd = "e ~/.config/fish/config.fish" },
  }

  local lines = { "  Select Config to Edit: ", "" }
  for _, item in ipairs(configs) do
    table.insert(lines, string.format("  [%s] %s", item.key, item.name))
  end
  table.insert(lines, "")
  table.insert(lines, "  [q/Esc] Quit")

  local width = 40
  local height = #lines
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  io.write("\27[?25l")

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "single",
    title = " Configs ",
    title_pos = "center",
  })

  vim.api.nvim_buf_add_highlight(buf, -1, "FloatBorder", 0, 0, -1)

  for line_idx, line in ipairs(lines) do
    local s, e = line:find("%[[%w%/]+%]")
    if s and e then
      vim.api.nvim_buf_add_highlight(buf, -1, "FloatBorder", line_idx - 1, s - 1, e)
    end
  end

  local function close()
    io.write("\27[?25h")
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end

  local opts = { buffer = buf, silent = true, nowait = true }

  vim.keymap.set("n", "<Esc>", close, opts)
  vim.keymap.set("n", "q", close, opts)

  for _, item in ipairs(configs) do
    vim.keymap.set("n", item.key, function()
      close()
      vim.cmd(item.cmd)
    end, opts)
  end
end

vim.keymap.set("n", "<leader>fc", open_config_menu, { desc = "Open Configs Menu" })
