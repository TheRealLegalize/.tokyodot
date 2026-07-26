local function toggle_oil()
    if vim.bo.filetype == "oil" then
        require("oil").close()
    else
        require("oil").open()
    end
end

vim.keymap.set("n", "<leader>n", toggle_oil, { desc = "Toggle Oil" })
