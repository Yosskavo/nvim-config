return {
  "andweeb/presence.nvim",
  event = "UIEnter",
  config = function()
    require("presence").setup({
      auto_update = true,
      neovim_image_text = "Neovim + LazyVim",
      main_image = "neovim",
      show_time = true,

      editing_text = "Editing %s",
      file_explorer_text = "Browsing files",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s",

      -- Don't include this line!
      -- line_number_text = "Line %l/%L",
    })
  end,
}
