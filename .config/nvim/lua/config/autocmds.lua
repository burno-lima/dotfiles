-- The default conceallevel is 3 in Lazyvim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd("Filetype", {
  pattern = { "python" },
  callback = function()
    vim.b.autoformat = false
  end,
})