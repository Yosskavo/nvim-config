-- 📝 Auto-save when switching back to Normal mode

-- ✅ Create the augroup and get its ID
local group = vim.api.nvim_create_augroup("autosave_on_normal", { clear = true })

-- ✅ Use the group ID here
vim.api.nvim_create_autocmd("ModeChanged", {
  group = group,
  pattern = "*:n",
  callback = function()
    if vim.bo.modified and vim.bo.modifiable and vim.fn.filewritable(vim.fn.expand("%")) == 1 then
      vim.cmd("silent write")
    end
  end,
})

