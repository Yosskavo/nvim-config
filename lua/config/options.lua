-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- ~/.config/nvim/lua/config/options.lua or lua/config/init.lua
-- vim.cmd.colorscheme("tokyonight-night")

-- ~/.config/nvim/lua/config/options.lua
vim.cmd([[highlight Normal guibg=#000000]])
vim.cmd([[highlight NormalNC guibg=#000000]])
vim.cmd([[highlight SignColumn guibg=#000000]])
vim.cmd([[highlight VertSplit guibg=#000000]])
vim.cmd([[highlight StatusLine guibg=#000000]])
vim.cmd([[highlight LineNr guibg=#000000]])

require("config.glow")
