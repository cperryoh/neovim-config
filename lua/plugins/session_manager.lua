return {
	{
		"Shatur/neovim-session-manager",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local Path = require("plenary.path")
			local config = require("session_manager.config")
			require("session_manager").setup({
				sessions_dir = Path:new(vim.fn.stdpath("data"), ".sessions"),
				autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
					"gitcommit",
					"gitrebase",
				},
				autosave_last_session = true, -- Automatically save last session on exit and on session switch.
				autosave_ignore_not_normal = true,
			})
		end,
	},
}
