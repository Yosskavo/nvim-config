return {
  "andweeb/presence.nvim",
  event = "VeryLazy",
  config = function()
    require("presence").setup({
      neovim_image_text = "Editing with LazyVim",
      enable_line_number = true,
    })
  end,
}
