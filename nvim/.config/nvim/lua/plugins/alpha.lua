return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                                  ]],
      [[                                                                                  ]],
      [[        ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄             ]],
      [[        ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄           ]],
      [[        ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███           ]],
      [[        ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███           ]],
      [[        ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███           ]],
      [[        ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███           ]],
      [[        ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███           ]],
      [[         ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀            ]],
      [[                                                                                  ]],
      [[                                                                                  ]],
    }

    -- 1. ГЛАВНОЕ МЕНЮ
    local main_buttons = {
      dashboard.button("f", "󰈞  Find File", "<cmd>Telescope find_files<cr>"),
      dashboard.button("r", "󰋚  Recent Files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("g", "󰊄  Live Grep", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("z", "󰉋  Zoxide", "<cmd>lua require('telescope').extensions.zoxide.list()<cr>"),
      dashboard.button("c", "  Configs  ", "<cmd>lua SwitchToConfigMenu()<cr>"),
      dashboard.button("q", "󰅚  Quit", "<cmd>qa<cr>"),
    }

    -- 2. ПОДМЕНЮ КОНФИГОВ
    local config_buttons = {
      dashboard.button("k", "󰄛  Kitty Config", "<cmd>e ~/.config/kitty/kitty.conf<cr>"),
      dashboard.button("h", "  Hyprland Modules", "<cmd>Telescope find_files cwd=~/.config/hypr<cr>"),
      dashboard.button("n", "  Neovim Config", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>"),
      dashboard.button("f", "  Fish", "<cmd>e ~/.config/fish/config.fish<cr>"),
      dashboard.button("b", "󰌍  Back", "<cmd>lua SwitchToMainMenu()<cr>"),
    }

    -- Очистка старых биндов и корректная привязка новых
    local function set_menu_buttons(buttons)
      dashboard.section.buttons.val = buttons

      -- Снимаем старые хоткеи
      local keys_to_unmap = { "f", "r", "g", "z", "c", "q", "k", "h", "n", "b" }
      for _, k in ipairs(keys_to_unmap) do
        pcall(vim.keymap.del, "n", k, { buffer = 0 })
      end

      -- Привязываем новые хоткеи
      for _, button in ipairs(buttons) do
        local shortcut = button.opts and button.opts.shortcut
        if shortcut then
          local key = shortcut:match("%s*(%S+)%s*")
          local action = button.on_press or (button.opts and button.opts.press)

          if key and action then
            vim.keymap.set("n", key, function()
              action()
            end, { buffer = 0, silent = true, nowait = true })
          end
        end
      end

      alpha.redraw()
    end

    _G.SwitchToConfigMenu = function()
      set_menu_buttons(config_buttons)
    end

    _G.SwitchToMainMenu = function()
      set_menu_buttons(main_buttons)
    end

    dashboard.section.buttons.val = main_buttons

    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val = "⚡ Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"

    alpha.setup(dashboard.opts)
  end,
}
