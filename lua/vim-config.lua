vim.cmd("set expandtab")
vim.cmd("setlocal spell spelllang=en_us");
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("nmap < v<")
vim.cmd("nmap > v>")
vim.cmd("imap jk <Esc>")
vim.cmd("nmap t <CMD>BufferNext<CR>")
vim.cmd("nmap T <CMD>BufferPrevious<CR>")
vim.g.mapleader = " "
vim.cmd("nmap <leader>wq :wq<CR>:qa<CR>")
vim.cmd("nmap <leader><CR> <C-w>l")
function man(args)
  os.execute("man "+args[0])
end
vim.api.nvim_create_user_command('Man',man, { count=1 })
