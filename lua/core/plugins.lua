local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
-- {
--   'vyfor/cord.nvim',
--   build = ':Cord update',
--   -- opts = {}
-- },
{
  "MagicDuck/grug-far.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  cmd = { "GrugFar", "GrugFarCurrentWord" },
  config = function()
    require("grug-far").setup()
  end,
},
	
{
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("plugins.surround")
  end,
},
{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
  end,
},

{
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  keys = { "<F1>" },
  opts = {
    default_map = true, -- Default mapping <F1> in normal mode.
    auto_update = true, -- Update header when saving.
    user = vim.env.USER,        -- <- environment variable USER
    mail = vim.env.MAIL, -- <- env var MAIL (or EMAIL fallback)
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
},

{
  "echasnovski/mini.icons",
  version = "*", -- Optional: specify a version or branch
  config = function()
    require("mini.icons").setup({
      style = "glyph", -- Choose 'glyph' for icons or 'ascii' for fallback
    })
  end,
},

  -- Colorscheme
  { 
    "folke/tokyonight.nvim", 
    lazy = false, 
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = { comments = { italic = true }, keywords = { italic = true } },
      })
      vim.cmd("colorscheme tokyonight")
    end
  },

  -- Treesitter
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate", 
    config = function() require("plugins.treesitter") end
  },

  -- Telescope
  { 
    "nvim-telescope/telescope.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("plugins.telescope") end
  },

  -- Lualine (statusline)
  { 
    "nvim-lualine/lualine.nvim", 
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function() require("plugins.lualine") end
  },

  -- Neo-tree (file explorer)
  { 
    "nvim-neo-tree/neo-tree.nvim", 
    branch = "v3.x",
    dependencies = { 
      "nvim-lua/plenary.nvim", 
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim" 
    },
    config = function() require("plugins.neo-tree") end
  },

  -- Barbar (buffer manager)
  { 
    "romgrk/barbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.barbar") end
  },

  -- LSP & Completion
  { 
        "neovim/nvim-lspconfig",
        config = function()
            -- local lspconfig = require("lspconfig"),
        require("plugins.lsp").setup({})
    end,
    },
  
{ 
	"hrsh7th/nvim-cmp", 

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
	config = function()
		require("plugins.cmp")  -- ← loads cmp.lua config only
    end,
},

{
  "TimUntersberger/neogit",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  cmd = "Neogit",
  config = function()
    require("neogit").setup({})
  end,
},

  -- Commenting
-- plugins/comment.lua
 {
    "numToStr/Comment.nvim",
    config = function()
        require("plugins.comment")
    end,
},

  -- Which-key (leader key popup)
  { 
  "folke/which-key.nvim",
  config = function()
    require("plugins.whichkey")  -- your config file
  end  },

  -- Trouble (diagnostics panel)
  { 
    "folke/trouble.nvim", 
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function() require("trouble").setup({}) end
  },

{
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  config = function()
    require("window-picker").setup({
      hint = "floating-big-letter",
    })
  end
},

    {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-t>]], -- toggle terminal with Ctrl + t
      shade_terminals = true,
      direction = "float",     -- 'horizontal' | 'vertical' | 'tab' | 'float'
      float_opts = {
        border = "curved",
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
        },
    })
  end,
},

{
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("plugins.alpha")  -- points to lua/plugins/alpha.lua
  end,
},

    {"kporceil/ftcountline.nvim",
	opts = {
		auto_update = true,
	},
	ft = {"c", "cpp"},
	},

    {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    },

  {
    "machakann/vim-highlightedyank",
    config = function()
      vim.cmd([[
        augroup HighlightYank
          autocmd!
          autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
        augroup END
      ]])
    end
  },

{
{
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("plugins.noice").setup()
  end,
},
},

{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
	 colors =  
	 {
	miss = "#FFA500",
	 },
  signs = true, -- show icons in the sign column
  keywords = {
    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    NOTE = { icon = " ", color = "hint", alt = { "info" } },
    MISS = { icon = "¿", color = "miss", alt = {"MISSING", "REVIEW"}},
  },
  highlight = {
    multiline = true,
    before = "",
    keyword = "wide",
    after = "fg",
  },
  },

  },

})
require("plugins.ui")()

