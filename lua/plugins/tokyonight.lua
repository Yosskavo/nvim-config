-- ~/.config/nvim/lua/plugins/tokyonight.lua
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     style = "night", -- 'storm', 'moon', 'night', 'day'
--     transparent = false,
--     styles = {
--       sidebars = "dark",
--       floats = "dark",
--     },
--   },
-- }

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = false,
    styles = {
      sidebars = "dark",
      floats = "dark",
    },
    on_colors = function(colors)
      colors.bg = "#000000" -- full black background
      colors.bg_dark = "#000000"
      colors.bg_float = "#000000"
      colors.bg_sidebar = "#000000"
    end,
  },
}
