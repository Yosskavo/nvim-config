require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = false,
  sort_case_insensitive = true,
  sort_function = nil,
  default_component_configs = {
    container = { enable_character_fade = true },
    indent = { padding = 1 },
    icon = { folder_closed = "", folder_open = "", folder_empty = "" },
    git_status = {
      symbols = {
        added     = "+",
        modified  = "~",
        deleted   = "-",
        renamed   = "»",
        untracked = "?",
        ignored   = "!",
      },
    },
  },
  window = {
    position = "left",
    width = 30,
    mappings = {
      ["<space>"] = "toggle_node",
      ["<cr>"] = "open",
      ["a"] = "add",
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
    },
  },
})

