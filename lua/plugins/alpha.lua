-- local alpha = require("alpha")
-- local dashboard = require("alpha.themes.dashboard")
--
-- -- === Header ===
-- dashboard.section.header.val = {
--     "                   ▄",
--   "                  ▟█▙",
--   "                 ▟███▙",
--   "                ▟█████▙",
--   "               ▟███████▙",
--   "              ▂▔▀▜██████▙",
--   "             ▟██▅▂▝▜█████▙",
--   "            ▟█████████████▙",
--   "           ▟███████████████▙",
--   "          ▟█████████████████▙",
--   "         ▟███████████████████▙",
--   "        ▟█████████▛▀▀▜████████▙",
--   "       ▟████████▛      ▜███████▙",
--   "      ▟█████████        ████████▙",
--   "     ▟██████████        █████▆▅▄▃▂",
--   "    ▟██████████▛        ▜█████████▙",
--   "   ▟██████▀▀▀              ▀▀██████▙",
--   "  ▟███▀▘                       ▝▀███▙",
--   " ▟▛▀                               ▀▜▙",
-- }
-- dashboard.section.header.opts.hl = "AlphaHeader"
-- vim.cmd("highlight AlphaHeader guifg=#5f87ff")  -- blue
--
-- -- === Buttons ===
-- local config_dir = vim.fn.stdpath("config")
-- dashboard.section.buttons.val = {
--     dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
--     dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
--     dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
--     dashboard.button("c", "  Config", ":Telescope find_files cwd=" .. config_dir .. "<CR>"),
--     dashboard.button("l", "💤 Lazy", ":Lazy<CR>"),
--     dashboard.button("q", "  Quit", ":qa<CR>"),
-- }
--
-- -- All buttons same color
-- dashboard.section.buttons.opts.hl = "AlphaButton"
-- vim.cmd("highlight AlphaButton guifg=#5f87ff")  -- blue
--
-- -- Center buttons horizontally
-- for _, button in ipairs(dashboard.section.buttons.val) do
--     button.opts.position = "center"
-- end
--
-- -- === Footer ===
-- dashboard.section.footer.val = "¿ made by : yosskavo"
-- dashboard.section.footer.opts.hl = "AlphaFooter"
-- vim.cmd("highlight AlphaFooter guifg=#5f87ff")  -- blue
-- dashboard.section.footer.opts.position = "center"
--
-- -- === Layout ===
-- dashboard.opts.layout = {
--     { type = "padding", val = 5 },
--     dashboard.section.header,
--     { type = "padding", val = 5 },
--     dashboard.section.buttons,
--     { type = "padding", val = 4 },
--     dashboard.section.footer,
-- }
--
--
--
--
-- -- local function get_time()
-- --   return os.date("%H:%M:%S")
-- -- end
-- --
-- -- -- Set footer initially
-- -- alpha.get_section("footer").val = get_time()
-- --
-- -- -- Update every second
-- -- vim.defer_fn(function()
-- --   local timer = vim.loop.new_timer()
-- --   timer:start(0, 1000, vim.schedule_wrap(function()
-- --     local footer = alpha.get_section("footer")
-- --     if footer then
-- --       footer.val = get_time()
-- --       alpha.redraw()  -- redraw Alpha
-- --     end
-- --   end))
-- -- end, 0)
--
--
--
--
-- local time_footer = dashboard.section.footer
-- time_footer.val = os.date("%H:%M:%S")
-- time_footer.opts.hl = "Type"
--
-- -- Update every second
-- local timer = vim.loop.new_timer()
-- timer:start(0, 1000, vim.schedule_wrap(function()
--   time_footer.val = os.date("%H:%M:%S")
--   alpha.redraw()
-- end))
--
--
-- -- === Apply Alpha dashboard ===
-- alpha.setup(dashboard.opts)




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
    dashboard.button("l", "💤 Lazy", ":Lazy<CR>"),
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
local footer = dashboard.section.footer
footer.opts.hl = "AlphaFooter"
vim.cmd("highlight AlphaFooter guifg=#5f87ff")  -- blue
footer.opts.position = "center"

-- Set initial value (text + time)
-- footer.val = "¿ made by : yosskavo  |  " .. os.date("%H:%M:%S")

local function get_footer()
  local time_line = "        " .. os.date("%H:%M:%S") .. "" 
  local name_line = "   made by : Yosskavo"
  return { time_line, name_line } -- multi-line footer
end

-- === Layout ===
dashboard.opts.layout = {
    { type = "padding", val = 5 },
    dashboard.section.header,
    { type = "padding", val = 5 },
    dashboard.section.buttons,
    { type = "padding", val = 4 },
    footer,
}

-- === Update footer every second ===
local timer = vim.loop.new_timer()
timer:start(0, 1000, vim.schedule_wrap(function()
  footer.val = get_footer()
  alpha.redraw()
end))

-- === Apply Alpha dashboard ===
alpha.setup(dashboard.opts)


