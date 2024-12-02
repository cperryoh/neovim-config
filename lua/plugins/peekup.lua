return {
	{
		"gennaro-tedesco/nvim-peekup",
		config = function()
			vim.api.nvim_set_keymap("n", '<leader>"', "<Plug>PeekupOpen", {})
			vim.api.nvim_set_keymap("n", "<leader>p", "<Plug>PeekupPasteBefore", {})
			vim.api.nvim_set_keymap("n", "<leader>P", "<Plug>PeekupPasteAfter", {})
		end,
	},
}
