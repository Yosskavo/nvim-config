-- plugins/ui.lua
return function()
  require("lazy").setup({
    ui = {
      border = "rounded",
      size = { width = 0.85, height = 0.85 },
      icons = {
        cmd = "",
        config = "🛠",
        plugin = "🔌",
        loaded = "✔",
        not_loaded = "✗",
      },
      keymaps = {
        toggle_info = "<CR>",
        expand = "o",
        install = "i",
        update = "u",
        check = "c",
        diff = "d",
        log = "l",
        restore = "r",
        profile = "p",
        mark = "m",
      },
    },
  })
end

