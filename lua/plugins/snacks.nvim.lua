return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = {
				enabled = true,
			},
			indent = { enabled = true },
			input = { enabled = true },
			picker = {
				enabled = true,

				layout = {
					backdrop = false,
					width = 40,
					min_width = 40,
					height = 0,
					position = "left",
					border = "none",
					box = "vertical",
					{
						win = "input",
						height = 1,
						border = "rounded",
						title = "{title} {live} {flags}",
						title_pos = "center",
					},
					{ win = "list", border = "none" },
					{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
				},
			},
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		config = function()
			local snacks = require("snacks")
			vim.keymap.set("n", "<leader>nn", function()
				snacks.explorer()
			end, { desc = "Open explorer" })
			return snacks
		end,
	},
}
