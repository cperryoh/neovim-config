return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			require("nvim-treesitter.install").compilers = { "gcc" }
			config.setup({
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = { enable = true },
			})
		end,
	},
}
