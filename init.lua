-- Leader key
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- Load core configs
require("core.autocomands")
require("core.highlights")
-- require("core.options")
require("core.autosave")
require("core.keymaps")
require("core.plugins")
--require("core.c_formatter")
--
-- -- Use actual tabs for ALL files
-- vim.opt.expandtab = false
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.softtabstop = 0
--
-- -- Disable visible whitespace (remove the > characters)
-- vim.opt.list = false
--
-- -- Ensure these settings apply to all file types
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = "*",
--     callback = function()
--         vim.opt.expandtab = false
--         vim.opt.tabstop = 4
--         vim.opt.shiftwidth = 4
--     end
-- })
--
--

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD700", bold = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#00BFFF" })  -- optional: dim other numbers
  end,
})

