vim.cmd.colorscheme("tokyonight-night")

return {
  "folke/tokyonight-night.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- 👈 this is the variant you want
    transparent = false, -- set to true if you want background transparency
    styles = {
      sidebars = "dark", -- Sidebar styling
      floats = "dark", -- Floating window styling
    },
    on_colors = function(colors)
      -- Optional: Make it darker or more blue
      colors.bg = "#0b0f1a"
      colors.bg_dark = "#0a0e18"
      colors.bg_float = "#0d111c"
    end,
    on_highlights = function(hl, c)
      -- Optional: Sharpen contrast for certain UI parts
      hl.Normal = { bg = c.bg, fg = c.fg }
      hl.CursorLine = { bg = "#111827" }
      hl.LineNr = { fg = "#3b4261" }
      hl.StatusLine = { bg = "#1a1b26", fg = "#a9b1d6" }
    end,
  },
}
