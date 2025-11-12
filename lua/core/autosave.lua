-- local group = vim.api.nvim_create_augroup("autosave_and_format", { clear = true })
--
-- vim.api.nvim_create_autocmd("ModeChanged", {
--   group = group,
--   pattern = "*:n",
--   callback = function()
--     local buf = vim.api.nvim_get_current_buf()
--     local filename = vim.api.nvim_buf_get_name(buf)
--     if not (vim.bo.modified and vim.bo.modifiable) then return end
--     if filename == "" then return end  -- new file with no name
--
--     -- Autosave for all files
--     vim.cmd("silent! write")
--
--     -- Formatter only for .c and .h
--     if filename:match("%.c$") or filename:match("%.h$") then
--       vim.fn.jobstart({ "c_formatter_42", filename }, {
--         stdout_buffered = true,
--         stderr_buffered = true,
--         on_exit = function(_, exit_code)
--           vim.schedule(function()
--             vim.cmd("silent! edit")
--             if exit_code == 0 then
--               vim.notify("✨ Formatted with c_formatter_42", vim.log.levels.INFO, {
--                 title = "C Formatter",
--               })
--             else
--               vim.notify("❌ Formatting failed", vim.log.levels.ERROR, {
--                 title = "C Formatter",
--               })
--             end
--           end)
--         end,
--       })
--     end
--   end,
--   desc = "Autosave all files + format only .c/.h files",
-- })

-- 🧠 File to store the formatter state











-- 🧠 File to store the formatter state
local state_file = vim.fn.stdpath("data") .. "/formatter_state"

-- 🗂️ Read saved state from file (true = enabled by default)
local function load_formatter_state()
  local f = io.open(state_file, "r")
  if f then
    local content = f:read("*a")
    f:close()
    return content:match("disabled") == nil
  end
  return true
end

-- 💾 Save current state to file
local function save_formatter_state(state)
  local f = io.open(state_file, "w")
  if f then
    f:write(state and "enabled" or "disabled")
    f:close()
  end
end

-- 🌍 Global toggle variable (persistent)
_G.formatter_enabled = load_formatter_state()

-- 🪄 Command to toggle formatter on/off
vim.api.nvim_create_user_command("ToggleFormatter", function()
  _G.formatter_enabled = not _G.formatter_enabled
  save_formatter_state(_G.formatter_enabled)

  local status = _G.formatter_enabled and "✅ Enabled" or "⛔ Disabled"
  vim.notify("Formatter " .. status, vim.log.levels.INFO, { title = "c_formatter_42" })
end, {})

-- 💾 Autosave + conditional formatting
local group = vim.api.nvim_create_augroup("autosave_and_format", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group = group,
  pattern = "*:n",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(buf)

    if not (vim.bo.modified and vim.bo.modifiable) or filename == "" then
      return
    end

    -- 📝 Auto-save all files
    vim.cmd("silent! write")

    -- 🎨 Run formatter only if enabled and file is .c or .h
    if _G.formatter_enabled and (filename:match("%.c$") or filename:match("%.h$")) then
      vim.fn.jobstart({ "c_formatter_42", filename }, {
        stdout_buffered = true,
        stderr_buffered = true,
        on_exit = function(_, exit_code)
          vim.schedule(function()
            vim.cmd("silent! edit")
            if exit_code == 0 then
              vim.notify("✨ Formatted with c_formatter_42", vim.log.levels.INFO, { title = "C Formatter" })
            else
              vim.notify("❌ Formatting failed", vim.log.levels.ERROR, { title = "C Formatter" })
            end
          end)
        end,
      })
    end
  end,
  desc = "Autosave + optionally format .c/.h files with toggle",
})



-- local state_file = vim.fn.stdpath("data") .. "/formatter_state"
--
-- -- 🗂️ Read saved state from file (true = enabled by default)
-- local function load_formatter_state()
--   local f = io.open(state_file, "r")
--   if f then
--     local content = f:read("*a")
--     f:close()
--     return content:match("disabled") == nil
--   end
--   return true
-- end
--
-- -- 💾 Save current state to file
-- local function save_formatter_state(state)
--   local f = io.open(state_file, "w")
--   if f then
--     f:write(state and "enabled" or "disabled")
--     f:close()
--   end
-- end
--
-- -- 🌍 Global toggle variable (persistent)
-- _G.formatter_enabled = load_formatter_state()
--
-- -- 🪄 Command to toggle formatter on/off
-- vim.api.nvim_create_user_command("ToggleFormatter", function()
--   _G.formatter_enabled = not _G.formatter_enabled
--   save_formatter_state(_G.formatter_enabled)
--
--   local status = _G.formatter_enabled and "✅ Enabled" or "⛔ Disabled"
--   vim.notify("Formatter " .. status, vim.log.levels.INFO, { title = "c_formatter_42" })
-- end, {})
--
-- -- 💾 Autosave + conditional formatting
-- local group = vim.api.nvim_create_augroup("autosave_and_format", { clear = true })
--
-- vim.api.nvim_create_autocmd("ModeChanged", {
--   group = group,
--   pattern = "*:n",
--   callback = function()
--     local buf = vim.api.nvim_get_current_buf()
--     local filename = vim.api.nvim_buf_get_name(buf)
--
--     if not (vim.bo.modified and vim.bo.modifiable) or filename == "" then
--       return
--     end
--
--     -- 📝 Auto-save all files
--     vim.cmd("silent! write")
--
--     -- 🎨 Run formatter only if enabled and file is .c or .h
--     if _G.formatter_enabled and (filename:match("%.c$") or filename:match("%.h$")) then
--       vim.fn.jobstart({ "c_formatter_42", filename }, {
--         stdout_buffered = true,
--         stderr_buffered = true,
--         on_exit = function(_, exit_code)
--           vim.schedule(function()
--             vim.cmd("silent! edit")
--             if exit_code == 0 then
--               vim.notify("✨ Formatted with c_formatter_42", vim.log.levels.INFO, { title = "C Formatter" })
--             else
--               vim.notify("❌ Formatting failed", vim.log.levels.ERROR, { title = "C Formatter" })
--             end
--           end)
--         end,
--       })
--     end
--   end,
--   desc = "Autosave + optionally format .c/.h files with toggle",
-- })
