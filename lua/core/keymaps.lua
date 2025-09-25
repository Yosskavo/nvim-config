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
vim.keymap.set("n", "<S-z>", "<Cmd>BufferClose<CR>")

-- windows thing

vim.keymap.set("n", "<leader>|", ":vsplit<CR>", opts) -- vertical split
vim.keymap.set("n", "<leader>-", ":split<CR>", opts)  -- horizontal split

-- terminal things

vim.keymap.set("n", "<C-/>", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-/>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true, desc = "Toggle terminal" })


-- norminette

vim.keymap.set("n", "<leader>cf", function()
  local file = vim.fn.expand("%")
  vim.cmd("write")  -- save current file first
  vim.cmd("silent! !c_formatter_42 " .. file .. " 2>/dev/null")  -- run it on the file
  vim.cmd("edit")   -- reload file after external formatting
end, { noremap = true, silent = true, desc = "Format C file (42)" })


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

