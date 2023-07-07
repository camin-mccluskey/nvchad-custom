local obsidianOpts = require "custom.configs.obsidian"

local M = {}

M.treesitter = {
  -- support parsers
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "dockerfile",
    "tsx",
    "rust",
    "python",
    "markdown",
    "markdown_inline",
    "prisma",
    "regex",
    "bash",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  highlight = {
    enable = true,
    -- for Obsidian.nvim
    additional_vim_regex_highlighting = { "markdown" },
  },
}

M.mason = {
  -- available language servers: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "vimls",

    -- other LSPs
    "css-lsp",
    "html-lsp",
    "deno",
    "typescript-language-server",
    "clojure-lsp",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "eslint",
    "gopls",
    "json-lsp",
    "prisma-language-server",
    "pyright",
    "rust-analyzer",
    "tailwindcss-language-server",
    "emmet-ls",
    "marksman",
    "astro-language-server",

    -- formatters
    "prettierd",
    "rustfmt",
    "black",

    -- linters
    "mypy",
    "ruff",
    "eslint_d",

    -- DAPs
    "debugpy",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  modified = {
    enable = true,
  },

  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },

  renderer = {
    icons = {
      show = {
        git = true,
        modified = false,
        folder_arrow = false,
      },
    },
  },
}

local actions = require "telescope.actions"
M.telescope = {
  defaults = {
    path = "~/.local/share/nvim/telescope_history",
    limit = 100,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions_list = { "smart_history" },
}

return M
