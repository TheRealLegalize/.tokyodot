-- Lazy init ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)



require("settings")

local functions_path = vim.fn.stdpath("config") .. "/lua/functions"
if vim.fn.isdirectory(functions_path) == 1 then
    local files = vim.fn.readdir(functions_path)
    for _, file in ipairs(files) do
        if file:match("%.lua$") then
            local module = "functions." .. file:gsub("%.lua$", "")
            require(module)
        end
    end
end
require("functions/relnum")
-- require("functions/toggleoil")


require("lazy").setup("plugins")
-- vim.cmd.colorscheme "monochrome"
vim.cmd.colorscheme "tokyonight"

