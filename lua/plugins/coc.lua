return {
	{
		"neoclide/coc.nvim",
		branch = "release",
		config = function()
			vim.cmd("nmap <leader>rn <plug>(coc-rename)")
		end,
	},
}
