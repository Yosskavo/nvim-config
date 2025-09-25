-- Auto-add 42-style header for .c and .h files using plugin/stdheader.vim
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = {"*.c", "*.h"},
  callback = function()
    local first_line = vim.fn.getline(1)
    if not string.match(first_line, "By:") then
      -- Call the Stdheader command from your Vim plugin
      vim.cmd("silent! Stdheader")
    end
  end,
})
