return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				css = { "rustywind" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				java = { "google_java" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				c = { "clang-format" },
				json = { "prettier" },
			},
			formatters = {
				google_java = {
					command = "java",
					args = {
						"-jar",
						"/Users/cperryoh/bin/googleFormat.jar",
						"--skip-removing-unused-imports",
						"--skip-sorting-imports",
						"-",
					},
				},
			},
		})
    vim.api.nvim_create_user_command('Format', function()
      require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, {})
    vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
      require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = 'Format file or range' })

	end,
}
