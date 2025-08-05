-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
--   pattern = { "*.c", "*.h" },
--   callback = function()
--     -- Check if header already exists by looking for ":::      ::::::::"
--     if vim.fn.search(":::      ::::::::", "nw") == 0 then
--       vim.cmd("Stdheader")
--     end
--   end,
-- })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.c",
  callback = function()
    if _G.norm_enabled then
      -- Run the external formatter
      vim.cmd("silent !python3 -m c_formatter_42 " .. vim.fn.expand("%"))

      -- Then re-run norm errors check to refresh diagnostics/signs
      local norm = require("42norm")
      if norm.check then
        norm.check()
      end
    end
  end,
})
