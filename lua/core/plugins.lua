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
  -- Colorscheme
  { 
    "folke/tokyonight.nvim", 
    lazy = false, 
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
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
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp" } },

  -- Git signs
  { 
    "lewis6991/gitsigns.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("gitsigns").setup() end
  },

  -- Commenting
  { 
    "numToStr/Comment.nvim", 
    config = function() require("Comment").setup() end
  },

  -- Which-key (leader key popup)
  { 
    "folke/which-key.nvim", 
    config = function() require("which-key").setup() end
  },

  -- Trouble (diagnostics panel)
  { 
    "folke/trouble.nvim", 
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function() require("trouble").setup({}) end
  },

  -- { 
  --   "lukas-reineke/indent-blankline.nvim",
  --       lazy = false,
  --    config = function()
  --     require("plugins.indent-blankline")
  --    end
  -- },

-- {
--   "lukas-reineke/indent-blankline.nvim",
--   event = "BufReadPre",  -- load on buffer open
--   config = function()
--     require("plugins.indent-blankline")
--   end,
-- }
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
      open_mapping = [[<C-\>]], -- toggle terminal with Ctrl + \
      shade_terminals = true,
      direction = "float",     -- 'horizontal' | 'vertical' | 'tab' | 'float'
      float_opts = {
        border = "curved",
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
	ft = "c",}


})


