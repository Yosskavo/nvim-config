-- lua/plugins/init.lua

-- _G.norm_enabled = true -- global variable to track state
--
-- function _G.toggle_norm()
--   _G.norm_enabled = not _G.norm_enabled
--   if _G.norm_enabled then
--     print("Auto-norm enabled")
--   else
--     print("Auto-norm disabled")
--   end
-- end
return {
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  },
}
