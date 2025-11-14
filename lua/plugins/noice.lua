-- ~/.config/nvim/lua/plugin/noice.lua
local M = {}

M.opts = {
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    position = {
      row = "50%",
      col = "50%",
    },
    size = {
      width = 40,
    },
  },

  messages = {
    enabled = true,
    view = "notify",
  },

  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },

  -- ===== add this section =====
  popupmenu = {
    enabled = true,
    max_height = 10,          -- show only 10 items at a time
    border = {
      style = "rounded",
      padding = { 0, 1 },
    },
    kind_icons = {},           -- optional
  },

  presets = {
    command_palette = true,
  },
}

function M.setup()
  require("noice").setup(M.opts)
end

return M
