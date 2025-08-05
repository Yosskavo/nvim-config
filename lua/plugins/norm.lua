return {
  {
    "MoulatiMehdi/42norm.nvim",
    config = function()
      require("42norm").setup({
        header_on_save = true, -- true for header_on_save
        format_on_save = true,
        liner_on_change = true,
      })

      -- Set environment variables for the 42 header
      vim.env.USER = "yel-mota" -- Replace with your 42 login
      vim.env.MAIL = "yel-mota@student.1337.ma" -- Replace with your 42 email

      -- Run c_formatter_42 on save for C files
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.c",
        callback = function()
          vim.cmd("silent !python3 -m c_formatter_42 " .. vim.fn.expand("%")) --remove "--no-header" for header_on_save
        end,
      })
    end,
  },
  {
    "hardyrafael17/norminette42.nvim",
    config = function()
      require("norminette").setup({
        runOnSave = true,
        maxErrorsToShow = 5,
        active = true,
      })
    end,
  },
}
