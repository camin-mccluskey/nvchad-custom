---@type MappingsTable
local M = {}

local function get_daily_note_path()
  return string.format(":e ~/Obsidian-camin-vault/Daily/%s.md<CR>", os.date("%Y-%m-%d"))
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>dn"] = {get_daily_note_path(), "Go to Daily Note page", opts = { noremap = true } },
    ["<leader>ct"] = {":normal! i" .. os.date("%H:%M:%S") .. "<CR>", "Paste Current Time", opts = { noremap = true } },
    ["<leader>ra"] = {":lua vim.lsp.buf.rename()<CR>", "lsp rename", opts = { noremap = true } },
  },
  v = {
    ["K"] = { ":move '<-2<CR>gv=gv", "move selection up" },
    ["J"] = { ":move '>+1<CR>gv=gv", "move selection down" },
  },
}

M.nvterm = {
 n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
        -- require("nvterm.terminal").send("source ~/.bash_profile", "float")
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
        -- require("nvterm.terminal").send("source ~/.bash_profile", "horizontal")
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
        -- require("nvterm.terminal").send("source ~/.bash_profile", "vertical")
      end,
      "toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
        -- require("nvterm.terminal").send("source ~/.bash_profile", "horizontal")
      end,
      "new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
        -- require("nvterm.terminal").send("source ~/.bash_profile", "vertical")
      end,
      "new vertical term",
    },
  },
}

-- more keybinds!
M.dap = {
  n = {
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Start Debugging",
    },
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint<CR>",
      "Toggle Breakpoint",
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open Debugging Sidebar",
    },
  },
}

return M
