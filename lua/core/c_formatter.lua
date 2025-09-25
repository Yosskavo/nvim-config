vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.h" },
  callback = function()
    vim.cmd("silent! %!c_formatter_42 %")
  end,
})

