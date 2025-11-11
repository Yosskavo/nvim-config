-- ~/.config/nvim/lua/plugin/noice.lua
local M = {}

M.opts = {
  cmdline = {
    enabled = true,         -- enable custom cmdline
    view = "cmdline_popup", -- show in the middle
    position = {
      row = "50%",          -- vertically centered
      col = "50%",          -- horizontally centered
    },
    size = {
      width = 40,           -- width of the popup
    },
  },
  messages = {
    enabled = true,         -- show :w, :q messages, etc.
    view = "notify",
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    command_palette = true, -- nicer command palette
  },
}

function M.setup()
  require("noice").setup(M.opts)
end

return M

