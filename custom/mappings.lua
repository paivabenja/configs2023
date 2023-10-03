---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    -- switch between windows
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<A-h>"] = "",
    ["<A-l>"] = "",
    ["<A-j>"] = "",
    ["<A-k>"] = "",
  },
}

M.nvterm = {
  n = {
    ["<C-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },
  t = {
    ["<C-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },
}

M.general = {
  n = {
    ["<Esc>"] = { ":noh <CR> : <Esc>", "Clear highlights" },
  },
}

-- more keybinds!

return M
