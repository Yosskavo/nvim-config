local map = vim.keymap.set
local opts = {noremap = true, silent = true}


-- Open horizontal terminal
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("split | terminal")  -- split horizontally and open :term
end, { noremap = true, silent = true, desc = "Horizontal terminal" })

-- Open vertical terminal
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal") -- split vertically and open :term
end, { noremap = true, silent = true, desc = "Vertical terminal" })


vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    -- Map <C-d> to close the terminal window
    vim.api.nvim_buf_set_keymap(0, "t", "<C-d>", "<C-\\><C-n>:close<CR>", { noremap = true, silent = true })
  end,
})

-- Save & quit
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })


-- some key maps for some plugins

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- switching between buffers

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Clear search

map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlight" })


-- Telescope
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>")

-- barbar

vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>")
-- vim.keymap.set("n", "<S-z>", "<Cmd>BufferClose<CR>")

-- windows thing

vim.keymap.set("n", "<leader>|", ":vsplit<CR>", opts) -- vertical split
vim.keymap.set("n", "<leader>-", ":split<CR>", opts)  -- horizontal split

-- terminal things

vim.keymap.set("n", "<C-/>", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-/>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true, desc = "Toggle terminal" })


-- norminette
map("n", "<leader>g", "<Nop>", { desc = "git" })        -- group header

map("n", "<leader>n", "<Nop>", { desc = "N" })        -- group header
vim.keymap.set("n", "<leader>nf", function()
  local file = vim.fn.expand("%")
  vim.cmd("write")  -- save current file first
  vim.cmd("silent! !c_formatter_42 " .. file .. " 2>/dev/null")  -- run it on the file
  vim.cmd("edit")   -- reload file after external formatting
end, { noremap = true, silent = true, desc = "Format C file (42)" })
vim.keymap.set("n", "<leader>nh", ":Stdheader<CR>", { noremap = true, silent = true })

--------- move lines

-- Move current line up
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Move current line down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })


-- Move selected lines up
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move selected lines down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- greep by telescope

vim.keymap.set("n", "<leader>lg", function()
  require('telescope.builtin').live_grep()
end, { desc = "Live grep word in files" })


-- Leader key double-tap for current directory Telescope
vim.keymap.set("n", "<leader><leader>", function()
    local opts = { cwd = vim.loop.cwd() }  -- current directory
    require("telescope.builtin").find_files(opts)
end, { noremap = true, silent = true, desc = "Telescope find files in cwd" })

vim.keymap.set("n", "<leader>m", "K", { 
    desc = "Look up man page for word under cursor", 
    noremap = true, 
    silent = true 
})

-- todo keymaps
vim.keymap.set("n", "<leader>st", ":TodoTelescope<CR>", { desc = "Search TODOs" })



-- File group
map("n", "<leader>f", "<Nop>", { desc = "File" })        -- group header
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find File" })
map("n", "<leader>fn", ":ene <BAR> startinsert<CR>", { desc = "New File" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent Files" })

-- Git group
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open Neogit" })
-- map("n", "<leader>g", "<Nop>", { desc = "Git" })         -- group header
-- map("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" })
-- map("n", "<leader>gs", ":Git status<CR>", { desc = "Git Status" })

-- Terminal group
map("n", "<leader>t", "<Nop>", { desc = "Terminal" })    -- group header
map("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
map("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Vertical Terminal" })

-- GrugFar search & replace keymaps
map("n", "<leader>s", "<Nop>", {desc = "search"})
vim.keymap.set("n", "<leader>sR", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], { desc = "Search and Replace in current file" })
vim.keymap.set("n", "<leader>sr", "<cmd>GrugFar<CR>", { desc = "Search and Replace (GrugFar)" })
vim.keymap.set("n", "<leader>sw", "<cmd>GrugFarCurrentWord<CR>", { desc = "Search word under cursor (GrugFar)" })


-- Load Comment.nvim first
local status, comment = pcall(require, "Comment")
if not status then
  return
end

-- -- Normal mode toggles
-- vim.keymap.set("n", "<leader>cc", function() comment.toggle.linewise.current() end, { desc = "Toggle line comment" })
-- vim.keymap.set("n", "<leader>cb", function() comment.toggle.blockwise.current() end, { desc = "Toggle block comment" })
--
-- -- Visual mode toggles
-- vim.keymap.set("v", "<leader>cc", function() comment.toggle.linewise(vim.fn.visualmode()) end, { desc = "Toggle line comment (visual)" })
-- vim.keymap.set("v", "<leader>cb", function() comment.toggle.blockwise(vim.fn.visualmode()) end, { desc = "Toggle block comment (visual)" })
--
-- -- Extra mappings
-- vim.keymap.set("n", "<leader>co", function() comment.insert.linewise.above() end, { desc = "Comment line above" })
-- vim.keymap.set("n", "<leader>cO", function() comment.insert.linewise.below() end, { desc = "Comment line below" })
-- vim.keymap.set("n", "<leader>cA", function() comment.insert.linewise.eol() end, { desc = "Comment at end of line" })
--

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Manual page for word under cursor
-- vim.keymap.set("n", "<leader>m", function()
--   vim.cmd("Man " .. vim.fn.expand("<cword>"))
-- end, { desc = "Manual for word under cursor" })

-- vim.keymap.set("n", "<S-q>", "<cmd>Man <C-r><C-w><CR>", { desc = "Open man page for word under cursor" })
-- vim.keymap.set("n", "Q", function()
--     local word = vim.fn.expand("<cword>")
--     if word ~= "" then
--         vim.cmd("Man " .. word)
--     else
--         print("No word under cursor")
--     end
-- end, { desc = "Open man page for word under cursor" })
-- vim.keymap.set("n", "Q", function()
--     local word = vim.fn.expand("<cword>")  -- get word under cursor
--     if word ~= "" then
--         vim.cmd("Man " .. vim.fn.shellescape(word))
--     else
--         print("No word under cursor")
--     end
-- end, { desc = "Open man page for word under cursor", noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>tm", "K", { desc = "Look up man page for word under cursor", noremap = true, silent = true })


-- vim.keymap.set("n", "<leader>sR", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], {
--   desc = 'Global Replace w/ Confirmation',
--   nowait = true, -- Stops Neovim from waiting for a potential longer map
-- })

-- visual mode mappings: pressing " or ( will surround selection
-- vim.keymap.set("x", '"', 'c"<c-r>""', { noremap = true, silent = true })
-- vim.keymap.set("x", "'", "c'<c-r>''", { noremap = true, silent = true })
-- vim.keymap.set("x", "(", "c(<c-r>\")", { noremap = true, silent = true })
-- vim.keymap.set("x", "[", "c[<c-r>\"]", { noremap = true, silent = true })
-- vim.keymap.set("x", "{", "c{<c-r>\"]", { noremap = true, silent = true })
-- vim.keymap.set("x", "<", "c<<c-r>\"]", { noremap = true, silent = true })


-- Surround visual selection without any plugin
-- local surround = function(open, close)
--   return string.format('c%s<C-r>"%s', open, close)
-- end
--
-- vim.keymap.set("x", '"',  surround('"', '"'),  { noremap = true, silent = true })
-- vim.keymap.set("x", "'",  surround("'", "'"),  { noremap = true, silent = true })
-- vim.keymap.set("x", "(",  surround("(", ")"),  { noremap = true, silent = true })
-- vim.keymap.set("x", "[",  surround("[", "]"),  { noremap = true, silent = true })
-- vim.keymap.set("x", "{",  surround("{", "}"),  { noremap = true, silent = true })
-- vim.keymap.set("x", "<",  surround("<", ">"),  { noremap = true, silent = true })


-- vim.keymap.set("n", "<leader>nt", ":ToggleFormatter<CR>", { desc = "Toggle C Formatter", noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>nt", ":ToggleFormatter", { desc = "Toggle C Formatter" })
-- local wk = require("which-key")

-- wk.register({
--   n = {
--     name = "Norminette / Formatter",  -- group name
--     nt = { ":ToggleFormatter<CR>", "Toggle C Formatter" },
--   }
-- }, { prefix = "<leader>" })



-- local wk = require("which-key")
--
-- wk.register({
--   ["<leader>nt"] = {
--     function()
--       _G.formatter_enabled = not _G.formatter_enabled
--       save_formatter_state(_G.formatter_enabled)
--       local status = _G.formatter_enabled and "✅ Enabled" or "⛔ Disabled"
--       vim.notify("Formatter " .. status, vim.log.levels.INFO, { title = "c_formatter_42" })
--     end,
--     "Toggle C Formatter"
--   },
-- })
