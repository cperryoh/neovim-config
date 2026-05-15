local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.clipboard = {
  name = 'wl-clipboard',
  copy = {
    ['+'] = 'wl-copy',
    ['*'] = 'wl-copy',
  },
  paste = {
    ['+'] = 'wl-paste',
    ['*'] = 'wl-paste',
  },
  cache_enabled = 1,
}
vim.g.netrw_browsex_viewer = "xdg-open"


if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("vim-config")
require("lazy").setup("plugins")
vim.cmd("colorscheme tokyonight")
vim.keymap.set("n", "<leader>k", vim.lsp.buf.rename)
vim.opt.updatetime = 1000  -- instead of 300
