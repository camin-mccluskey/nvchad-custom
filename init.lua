local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

vim.opt.termguicolors = true

-- Auto jump to last position in file when opening file
local auGroupJumpLast = autogroup("JumpLast", { clear = true })
autocmd("BufEnter", {
  pattern = "*",
  command = "silent! '\"", -- jump to last position in file
  group = auGroupJumpLast,
})
