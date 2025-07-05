-- This forces LazyVim to use your colorscheme
vim.g.colors_name = "tokyonight"

require("tokyonight").setup({
  style = "night",
  transparent = false, -- or true
  styles = {
    sidebars = "dark",
    floats = "dark",
  },
  on_colors = function(colors)
    colors.bg = "#0b0f1a"
    colors.bg_dark = "#0a0e18"
    colors.bg_float = "#0d111c"
  end,
  on_highlights = function(hl, c)
    hl.Normal = { bg = c.bg, fg = c.fg }
    hl.CursorLine = { bg = "#111827" }
    hl.LineNr = { fg = "#3b4261" }
    hl.StatusLine = { bg = "#1a1b26", fg = "#a9b1d6" }
  end,
})

vim.cmd.colorscheme("tokyonight")
require("config.glow")

-- ~/.config/nvim/lua/config/init.lua

function ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match("^config") then
      package.loaded[name] = nil
    end
  end
  require("config.lazy")
  require("config.colorscheme")
end
