local group = vim.api.nvim_create_augroup("autosave_and_format", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group = group,
  pattern = "*:n",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(buf)
    if not (vim.bo.modified and vim.bo.modifiable) then return end
    if filename == "" then return end  -- new file with no name

    -- Autosave for all files
    vim.cmd("silent! write")

    -- Formatter only for .c and .h
    if filename:match("%.c$") or filename:match("%.h$") then
      vim.fn.jobstart({ "c_formatter_42", filename }, {
        stdout_buffered = true,
        stderr_buffered = true,
        on_exit = function(_, exit_code)
          vim.schedule(function()
            vim.cmd("silent! edit")
            if exit_code == 0 then
              vim.notify("✨ Formatted with c_formatter_42", vim.log.levels.INFO, {
                title = "C Formatter",
              })
            else
              vim.notify("❌ Formatting failed", vim.log.levels.ERROR, {
                title = "C Formatter",
              })
            end
          end)
        end,
      })
    end
  end,
  desc = "Autosave all files + format only .c/.h files",
})

