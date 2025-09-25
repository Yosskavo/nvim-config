
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- === Header ===
dashboard.section.header.val = {
    "                   ▄",
  "                  ▟█▙",
  "                 ▟███▙",
  "                ▟█████▙",
  "               ▟███████▙",
  "              ▂▔▀▜██████▙",
  "             ▟██▅▂▝▜█████▙",
  "            ▟█████████████▙",
  "           ▟███████████████▙",
  "          ▟█████████████████▙",
  "         ▟███████████████████▙",
  "        ▟█████████▛▀▀▜████████▙",
  "       ▟████████▛      ▜███████▙",
  "      ▟█████████        ████████▙",
  "     ▟██████████        █████▆▅▄▃▂",
  "    ▟██████████▛        ▜█████████▙",
  "   ▟██████▀▀▀              ▀▀██████▙",
  "  ▟███▀▘                       ▝▀███▙",
  " ▟▛▀                               ▀▜▙",
}
dashboard.section.header.opts.hl = "AlphaHeader"
vim.cmd("highlight AlphaHeader guifg=#5f87ff")  -- blue

-- === Buttons ===
local config_dir = vim.fn.stdpath("config")
dashboard.section.buttons.val = {
    dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("c", "  Config", ":Telescope find_files cwd=" .. config_dir .. "<CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- All buttons same color
dashboard.section.buttons.opts.hl = "AlphaButton"
vim.cmd("highlight AlphaButton guifg=#5f87ff")  -- blue

-- Center buttons horizontally
for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.position = "center"
end

-- === Footer ===
dashboard.section.footer.val = "¿ made by : yosskavo"
dashboard.section.footer.opts.hl = "AlphaFooter"
vim.cmd("highlight AlphaFooter guifg=#5f87ff")  -- blue
dashboard.section.footer.opts.position = "center"

-- === Layout ===
dashboard.opts.layout = {
    { type = "padding", val = 5 },
    dashboard.section.header,
    { type = "padding", val = 5 },
    dashboard.section.buttons,
    { type = "padding", val = 4 },
    dashboard.section.footer,
}

        -- local function get_datetime()
        --     return os.date("󰃰 %Y-%m-%d  󰥔 %H:%M:%S")

-- === Apply Alpha dashboard ===
alpha.setup(dashboard.opts)



