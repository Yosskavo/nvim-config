-- lua/plugins/which-key.lua
local wk = require("which-key")

wk.setup({
  plugins = {
    spelling = { enabled = true },
  },
  win = {
    border = "single",
  },
})

