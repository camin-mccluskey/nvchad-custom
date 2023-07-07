local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.prettier,
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "typescript", "javascript", "tsx", "jsx" } }, -- so prettier works only on these filetypes
  -- b.diagnostics.eslint.with { filetypes = { "typescript", "javascript", "tsx", "jsx" } }, -- so eslint works only on these filetypes

  -- new formating/linting
  b.formatting.prettierd,
  b.diagnostics.eslint_d.with {
    diagnostics_format = "[eslint] #{m}\n(#{c})",
  },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.diagnostics.mypy,
  b.diagnostics.ruff,
  b.formatting.black,
}

local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}

vim.api.nvim_create_user_command("DisableLspFormatting", function()
  vim.api.nvim_clear_autocmds { group = augroup, buffer = 0 }
end, { nargs = 0 })
