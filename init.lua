require("config.lazy")

--require("config.alpha")
require("lazy").setup("plugins") -- loads lua/plugins/init.lua
require("config.keymaps") -- loads keymaps (lua/plugins/keymaps.lua)
-- require("config.hightlights") -- loads keymaps (lua/plugins/keymaps.lua)
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
]])
