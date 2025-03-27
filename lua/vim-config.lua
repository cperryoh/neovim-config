-- Set leader key
vim.g.mapleader = " "

-- Use vim.opt for setting options
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Helper function: Wrap text between quotes in {`backticks`}
vim.keymap.set("n", "<leader>qt", function()
  -- Save current cursor position
  local pos = vim.api.nvim_win_get_cursor(0)
  -- Perform substitution: this replaces text between double quotes with {`text`}
  vim.cmd([[s/"\([^"]*\)"/{`%1`}/]])
  vim.cmd("noh")
  -- Restore cursor position
  vim.api.nvim_win_set_cursor(0, pos)
end, { desc = "Wrap quote-enclosed text in {`backticks`}" })

-- Terminal mode: Exit to normal mode mapping
vim.keymap.set("t", "<esc>", "<C-\\><C-N>", { noremap = true, desc = "Back to normal mode" })

-- File operations
vim.keymap.set("n", "<leader>fw", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>fq", ":wqa<CR>", { noremap = true, silent = true, desc = "Save and quit all" })
vim.keymap.set("n", "<leader>wq", ":wq<CR>:qa<CR>", { noremap = true, silent = true, desc = "Write and quit" })

-- Window management mappings (grouped for clarity)
local window_mappings = {
  wv = "<C-W><C-V>",
  wh = "<C-W><C-N>",
  mj = "<C-W>J",
  mr = "<C-W>r",
  mh = "<C-W>H",
  mk = "<C-W>K",
  ml = "<C-W>l",
  j  = "<C-W>j",
  h  = "<C-W>h",
  k  = "<C-W>k",
  l  = "<C-W>l",
}
for key, cmd in pairs(window_mappings) do
  vim.keymap.set("n", "'" .. key, cmd, { noremap = true, silent = true })
end

-- Window resizing mappings
vim.keymap.set("n", "=", "<cmd>vertical resize +5<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "-", "<cmd>vertical resize -5<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "+", "<cmd>horizontal resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "_", "<cmd>horizontal resize -2<cr>", { desc = "Decrease window height" })

-- Miscellaneous mappings
vim.keymap.set("n", "T", ":BufferPrevious<CR>", { desc = "Switch to previous buffer", noremap = true, silent = true })
vim.keymap.set("n", "t", ":BufferNext<CR>", { desc = "Switch to next buffer", noremap = true, silent = true })
vim.keymap.set("n", "cc", ":BufferClose<CR>", { desc = "Close current buffer", noremap = true, silent = true })
vim.keymap.set("n","<leader>n", ":tabnew<cr>",{desc="Make new tab",noremap=true,silent=true})
vim.keymap.set("n", "<leader><CR>", "<C-w>l", { desc = "Move to right window", noremap = true, silent = true })

vim.keymap.set("n", "<leader>nc", ":Neotree close<cr>", { desc = "Close neotree", noremap = true, silent = true })

-- (Optional) Mapping for indent adjustments in visual mode
vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_set_keymap("n", "<leader>fq", ":wqa<CR>", { noremap = true, silent = true })
vim.cmd("setlocal spell spelllang=en_us")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("nmap < v<")
vim.cmd("nmap > v>")

-- Insert mode mapping: use 'jk' to exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, desc = "Exit insert mode" })

-- LSP mappings grouped in a loop for clarity
local lsp_mappings = {
  ln  = "rename",
  la  = "code_action",
  lrr = "references",
  li  = "implementation",
  ld  = "document_symbol",
  lh  = "signature_help",
}
for key, func in pairs(lsp_mappings) do
  vim.keymap.set("n", "<leader>" .. key, "<CMD>lua vim.lsp.buf." .. func .. "()<CR>", { desc = "LSP: " .. func })
end

-- Improved Man command using proper Lua string concatenation
vim.api.nvim_create_user_command("Man", function(opts)
  if opts.args == "" then
    print("Usage: :Man <topic>")
    return
  end
  os.execute("man " .. opts.args)
end, { nargs = 1 })

