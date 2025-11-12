-- local wk = require("which-key")
-- wk.register({
--   ["<leader>nt"] = {
--     function()
--       _G.formatter_enabled = not _G.formatter_enabled
--       -- Make sure your save function exists
--       if vim.fn.filereadable(_G.formatter_state_file or "") == 1 then
--         local f = io.open(_G.formatter_state_file, "w")
--         if f then
--           f:write(_G.formatter_enabled and "enabled" or "disabled")
--           f:close()
--         end
--       end
--       local status = _G.formatter_enabled and "✅ Enabled" or "⛔ Disabled"
--       vim.notify("Formatter " .. status, vim.log.levels.INFO, { title = "c_formatter_42" })
--     end,
--     "Toggle C Formatter"
--   },
-- })
--
--



vim.keymap.set("n", "<leader>nt", ":ToggleFormatter<CR>", { desc = "Toggle C Formatter" })
