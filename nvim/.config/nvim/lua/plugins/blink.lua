return {
  {
    "saghen/blink.cmp",
    version = "",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      'saghen/blink.lib',
    },
    opts = {
      snippets = {
        preset = "luasnip",
      },

      keymap = {
        preset = "none",  
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<M-e>"] = { "hide" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
        
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
      },

      completion = {
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" }, auto_show = true },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    config = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("blink.cmp").setup(opts)
    end,
  },
}
