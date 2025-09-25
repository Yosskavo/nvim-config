require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "c", "cpp", "python" },
  highlight = { enable = true },
  indent = { enable = true },
})

