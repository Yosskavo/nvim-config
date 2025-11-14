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
  local ok_lsp, lspconfig = pcall(require, "lspconfig")
  if not ok_lsp then return end

  -- Add cmp_nvim_lsp capabilities
  local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  local capabilities = ok_cmp and cmp_lsp.default_capabilities() or nil

  lspconfig.clangd.setup({
    capabilities = capabilities,
  })
end

return M
