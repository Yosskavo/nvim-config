-- Header (ASCII art)
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#3F4CBC", bold = true })

-- Buttons
vim.api.nvim_set_hl(0, "DashboardButtons", { fg = "#c51616", bold = true })

-- Footer
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#89e051", italic = true })

-- lua/core/highlight.lua

-- Alpha dashboard button colors
vim.cmd("highlight AlphaRed guifg=#ff0000")
vim.cmd("highlight AlphaGreen guifg=#00ff00")
vim.cmd("highlight AlphaBlue guifg=#00aaff")
vim.cmd("highlight AlphaYellow guifg=#ffff00")
vim.cmd("highlight AlphaPurple guifg=#aa00ff")

-- You can also define more highlights here if needed
