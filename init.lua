local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.opt.termguicolors = true

-- Auto jump to last position in file when opening file
local auGroupJumpLast = autogroup("JumpLast", { clear = true })
autocmd("BufEnter", {
  pattern = "*",
  command = "silent! '\"", -- jump to last position in file
  group = auGroupJumpLast,
})

-- enable code folding in Treesitter
-- vim.wo.foldmethod="expr"
-- vim.o.foldexpr="nvim_treesitter#foldexpr()"
-- vim.wo.foldenable=false -- can be enabled directly in opened file - using 'zi' - toogle fold
-- local ayGroupFold = autogroup("Fold", { clear = true })
-- autocmd({ "BufEnter" }, {
--     pattern = { "*" },
--     command = "normal zx zR",
--     group = ayGroupFold,
-- })
