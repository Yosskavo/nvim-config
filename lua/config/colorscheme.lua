vim.cmd.colorscheme("tokyonight")

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
    styles = {
      sidebars = "transparent", -- change from "dark" to "transparent"
      floats = "transparent", -- change from "dark" to "transparent"
    },
    on_colors = function(colors)
      -- Remove any forced bg colors here for full transparency
      colors.bg = "NONE"
      colors.bg_dark = "NONE"
      colors.bg_float = "NONE"
    end,
    on_highlights = function(hl, c)
      -- Set background to NONE (transparent) explicitly
      hl.Normal = { bg = "NONE", fg = c.fg }
      hl.NormalNC = { bg = "NONE" }
      hl.LineNr = { fg = "#3b4261", bg = "NONE" }
      hl.CursorLine = { bg = "NONE" }
      hl.StatusLine = { bg = "NONE", fg = "#a9b1d6" }
      hl.VertSplit = { bg = "NONE" }
      hl.SignColumn = { bg = "NONE" }
      -- Add any other highlights you want transparent here
    end,
  },
}
