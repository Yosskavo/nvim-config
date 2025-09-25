-- Leader key
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- Load core configs
require("core.highlights")
require("core.options")
require("core.keymaps")
require("core.plugins")
--require("core.c_formatter")
