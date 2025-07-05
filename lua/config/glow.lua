-- Glowing effect simulation using bright bold colors
-- vim.api.nvim_set_hl(0, "Normal", { fg = "#00ffff", bg = "#000000", bold = true })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#5fd7ff", italic = true })
-- vim.api.nvim_set_hl(0, "Keyword", { fg = "#ff5fff", bold = true })
-- vim.api.nvim_set_hl(0, "String", { fg = "#afff00", bold = true })
-- vim.api.nvim_set_hl(0, "Function", { fg = "#00d7ff", bold = true })
-- vim.api.nvim_set_hl(0, "Type", { fg = "#d75fff", bold = true })
-- vim.api.nvim_set_hl(0, "Identifier", { fg = "#ff87ff", bold = true })
-- vim.api.nvim_set_hl(0, "Statement", { fg = "#ff5f5f", bold = true })

-- Glowing-like highlight tweak
local function glow(group, color)
  vim.api.nvim_set_hl(0, group, {
    fg = color,
    bg = "#000000",
    bold = true,
    italic = true,
    underline = true,
  })
end

glow("Normal", "#00ffff") -- neon cyan
glow("Comment", "#5fafff") -- soft blue
glow("Keyword", "#ff5fff") -- purple pink
glow("String", "#afff00") -- toxic green
glow("Function", "#00dfff") -- bright sky blue
glow("Type", "#df5fff") -- deep purple
glow("Identifier", "#ff87ff") -- bright pink
glow("Statement", "#ff5f5f") -- neon red
glow("CursorLineNr", "#00ffff") -- glowing cursor line number
glow("LineNr", "#444444") -- dimmed for contrast
glow("StatusLine", "#00ffff") -- bright cyan statusline
