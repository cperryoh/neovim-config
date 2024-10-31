return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>nc", ":Neotree close<CR>", {})
		vim.keymap.set("n", "<leader>nn", ":Neotree filesystem reveal right<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		require("neo-tree").setup({
			event_handlers = {

				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
	end,
}
