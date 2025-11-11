-- -- ~/.config/nvim/lua/plugin/lsp.lua
-- local M = {}
--
-- function M.setup()
--   -- Define your LSP configuration
--   vim.lsp.config["clangd"] = {
--     cmd = { "clangd" },
--     filetypes = { "c", "cpp", "objc", "objcpp" },
--     root_dir = vim.fs.root(0, { "compile_commands.json", "compile_flags.txt", ".git" }),
--     capabilities = vim.lsp.protocol.make_client_capabilities(),
--     on_attach = function(_, bufnr)
--       local opts = { buffer = bufnr }
--       vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     end,
--   }
--
--   -- Start clangd
--   vim.lsp.start(vim.lsp.config["clangd"])
-- end
--
-- return M

-- plugin/lsp.lua
local M = {}

function M.setup()
  local ok, lspconfig = pcall(require, "lspconfig")
  if not ok then return end

  lspconfig.clangd.setup({})
end

return M
