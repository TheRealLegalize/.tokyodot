return {
  'nvim-lualine/lualine.nvim',
  config = function()

    local function lsp_status()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then
        return ''
      end

      local client_names = {}
      for _, client in pairs(clients) do
        if client.name ~= 'null-ls' and client.name ~= 'none-ls' then
          table.insert(client_names, client.name)
        end
      end

      if #client_names == 0 then
        return ''
      end

      return table.concat(client_names, ', ')
    end


    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        ignore_focus = {},
        always_divide_middle = false,
        always_show_tabline = false,
        globalstatus = false,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            upper = false,
            fmt = function(str)
              local modes = {
                ['NORMAL']   = 'ɴᴏʀᴍᴀʟ',
                ['INSERT']   = 'ɪɴsᴇʀᴛ',
                ['VISUAL']   = 'ᴠɪsᴜᴀʟ',
                ['V-LINE']   = 'ᴠ-ʟɪɴᴇ',
                ['V-BLOCK']  = 'ᴠ-ʙʟᴏᴄᴋ',
                ['REPLACE']  = 'ʀᴇᴘʟᴀᴄᴇ',
                ['COMMAND']  = 'ᴄᴏᴍᴍᴀɴᴅ',
                ['TERMINAL'] = 'ᴛᴇʀᴍɪɴᴀʟ',
              }
              return modes[str] or modes[str:upper()] or st
            end
          }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {'filename', 'encoding'},
        lualine_y = {lsp_status},
        lualine_z = {},
      },
    }
  end
}




















    -- local function char_count()
    --   local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    --   local count = 0
    --
    --   for _, line in ipairs(lines) do
    --     count = count + vim.fn.strchars(line)
    --   end
    --
    --   if count > 0 then
    --     count = count + (#lines - 1)
    --   end
    --
    --   return 'ᴄʜᴀʀꜱ: ' .. count
    -- end

