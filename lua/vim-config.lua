vim.g.mapleader = " "

vim.cmd("set expandtab")
vim.api.nvim_set_keymap("t", "<esc>", "<C-\\><C-N>", { noremap = true, desc = "back to normal mode" })
vim.api.nvim_set_keymap("n", "<leader>fw", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\wv", "<C-W><C-V>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\wh", "<C-W><C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\mj", "<C-W>J", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\mr", "<C-W>r", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\mh", "<C-W>H", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\mk", "<C-W>K", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\ml", "<C-W>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "\\j", "<C-W>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\h", "<C-W>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\k", "<C-W>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\l", "<C-W>l", { noremap = true, silent = true })

vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_set_keymap("n", "<leader>fq", ":wqa<CR>", { noremap = true, silent = true })
vim.cmd("setlocal spell spelllang=en_us")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("nmap < v<")
vim.cmd("nmap > v>")
vim.cmd("imap jk <Esc>")
vim.cmd("nmap T <CMD>BufferPrevious<CR>")

vim.cmd("nmap tn <CMD>BufferNext<CR>")
vim.cmd("nmap tp <CMD>BufferPrevious<CR>")
vim.cmd("nnoremap tc :tabclose<CR>")
vim.cmd("nmap <leader>wq :wq<CR>:qa<CR>")
vim.cmd("nmap <leader><CR> <C-w>l")

-- lsp stuff
vim.api.nvim_set_keymap("n", "<leader>ln", "<CMD>lua vim.lsp.buf.rename()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>la", "<CMD>lua vim.lsp.buf.code_action()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>lrr", "<CMD>lua vim.lsp.buf.references()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>li", "<CMD>lua vim.lsp.buf.implementation()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ld", "<CMD>lua vim.lsp.buf.document_symbol()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>lh", "<CMD>lua vim.lsp.buf.signature_help()<CR>", {})

function man(args)
	os.execute("man " + args[0])
end
vim.api.nvim_create_user_command("Man", man, { count = 1 })
