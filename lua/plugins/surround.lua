
-- ~/.config/nvim/lua/config/surround.lua

require("nvim-surround").setup({
  line_continuation = "wrap",
  -- keymaps = {
  --   visual = "S",              -- visual mode mapping
  --   visual_line = "S",         -- visual line mapping uses same behavior
  -- },
  surrounds = {
    ["("] = {
      add = { "(", ")" },            -- no spaces
    },
    ["["] = {
      add = { "[", "]" },            -- no spaces
    },
    ["{"] = {
      add = { "{", "}" },
    },
    ["<"] = {
      add = { "<", ">" },
    },
    ['"'] = {
      add = { '"', '"' },
    },
    ["'"] = {
      add = { "'", "'" },
    },
  },
})
