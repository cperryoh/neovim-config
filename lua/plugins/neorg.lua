-- lazy.nvim spec
local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  dependencies = {
    "luarocks.nvim", -- this is it.
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-lua/plenary.nvim",
  },
  -- build = ":Neorg sync-parsers", -- and delete this line.
  cmd = "Neorg",
}
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set conceallevel=3",
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.norg",
  callback = function()
    require("which-key").register({
      ["<leader>,"] = { name = "+neorg" },
      ["<leader>,i"] = { name = "+insert" },
      ["<leader>,l"] = { name = "+list" },
      ["<leader>,m"] = { name = "+mode" },
      ["<leader>,n"] = { name = "+note" },
      ["<leader>,t"] = { name = "+task" },
    }, { buffer = 0 })
  end,
})
local modules = {
  ["core.defaults"] = {},
  ["core.concealer"] = { 
    config = {
      icon_preset = "varied",
      icons={
        list = {
          icons = {"•","-","◦","■","~"}
        }
      }
    } 
  },
  ["core.keybinds"] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = "<leader>,",
    },
  },
  ["core.dirman"] = {
    config = {
      workspaces = {
        Notes = "~/notes",
      }
    }
  },
}
M.opts = {
  load = modules,
}

return M
