return {
	{
		"neoclide/coc.nvim",
		dependencies = {
			"folke/which-key.nvim",
		},
		branch = "release",
		config = function()
					local normal_mappings = {}
					local opts_mappings = {}
					local wk = require("which-key")
					-- Define a function to check if CoC should be disabled for a given filetype

					-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

					-- Some servers have issues with backup files, see #649
					vim.opt.backup = false
					vim.opt.writebackup = false

					-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
					-- delays and poor user experience
					vim.opt.updatetime = 300

					-- Always show the signcolumn, otherwise it would shift the text each time
					-- diagnostics appeared/became resolved
					vim.opt.signcolumn = "yes"

					local keyset = vim.keymap.set
					-- Autocomplete
					function _G.check_back_space()
						local col = vim.fn.col(".") - 1
						return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
					end

					-- Use Tab for trigger completion with characters ahead and navigate
					-- NOTE: There's always a completion item selected by default, you may want to enable
					-- no select by setting `"suggest.noselect": true` in your configuration file
					-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
					-- other plugins before putting this into your config
					local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
					opts_mappings["<TAB>"] = {
						'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
						"[Coc] Goto next suggestion",
						mode = "i",
					}
					opts_mappings["<S-TAB>"] =
						{ [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], "which_key_ignore", mode = "i" }

					-- Make <CR> to accept selected completion item or notify coc.nvim to format
					-- <C-g>u breaks current undo, please make your own choice
					opts_mappings["<cr>"] = {
						[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
						"[Coc]Accepct completion",
						mode = "i",
					}

					-- Use <c-j> to trigger snippets
					normal_mappings["<c-j>"] = { "<Plug>(coc-snippets-expand-jump)", "give me description", mode = "i" }
					-- Use <c-space> to trigger completion
					normal_mappings["<c-space>"] =
						{ "coc#refresh()", "give me description", mode = "i", silent = true, expr = true }

					-- Use `[g` and `]g` to navigate diagnostics
					-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
					normal_mappings["[g"] =
						{ "<Plug>(coc-diagnostic-prev)", "[Coc] Prev diagnostic", mode = "n", silent = true }
					normal_mappings["]g"] =
						{ "<Plug>(coc-diagnostic-next)", "[Coc] Next diagnostic", mode = "n", silent = true }

					-- GoTo code navigation
					normal_mappings.g = { name = "+nav" }
					normal_mappings.g.d = { "<Plug>(coc-definition)", "[Coc] Defition", mode = "n", silent = true }
					normal_mappings.g.y =
						{ "<Plug>(coc-type-definition)", "[Coc] Type definition", mode = "n", silent = true }
					normal_mappings.g.i =
						{ "<Plug>(coc-implementation)", "[Coc] implementation", mode = "n", silent = true }
					normal_mappings.g.r = { "<Plug>(coc-references)", "[Coc] references", mode = "n", silent = true }

					-- Use K to show documentation in preview window
					function _G.show_docs()
						local cw = vim.fn.expand("<cword>")
						if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
							vim.api.nvim_command("h " .. cw)
						elseif vim.api.nvim_eval("coc#rpc#ready()") then
							vim.fn.CocActionAsync("doHover")
						else
							vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
						end
					end

					normal_mappings["<leader>d"] =
						{ "<CMD>lua _G.show_docs()<CR>", "[Coc] Show docs", mode = "n", silent = true }

					-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
					vim.api.nvim_create_augroup("CocGroup", {})
					vim.api.nvim_create_autocmd("CursorHold", {
						group = "CocGroup",
						command = "silent call CocActionAsync('highlight')",
						desc = "Highlight symbol under cursor on CursorHold",
					})

					-- Symbol renaming
					normal_mappings["<leader>rn"] =
						{ "<Plug>(coc-rename)", "[Coc] Rename symbol", mode = "n", silent = true }

					-- Update signature help on jump placeholder
					vim.api.nvim_create_autocmd("User", {
						group = "CocGroup",
						pattern = "CocJumpPlaceholder",
						command = "call CocActionAsync('showSignatureHelp')",
						desc = "Update signature help on jump placeholder",
					})

					-- Apply codeAction to the selected region
					-- Example: `<leader>aap` for current paragraph

					wk.register(opts_mappings, opts)
					local opts_mappings = {}
					local opts = { silent = true, nowait = true }
					opts_mappings["<leader>a"] =
						{ "<Plug>(coc-codeaction-selected)", "[Coc] Code action selection", mode = "x" }
					opts_mappings["<leader>a"] =
						{ "<Plug>(coc-codeaction-selected)", "[Coc] Code action selection", mode = "n" }

					-- Remap keys for apply code actions at the cursor position.
					opts_mappings["<leader>ac"] =
						{ "<Plug>(coc-codeaction-cursor)", "[Coc] Code action cursor", mode = "n" }
					-- Remap keys for apply source code actions for current file.
					opts_mappings["<leader>as"] =
						{ "<Plug>(coc-codeaction-source)", "[Coc] Code action source", mode = "n" }
					-- Apply the most preferred quickfix action on the current line.
					opts_mappings["<leader>qf"] = { "<Plug>(coc-fix-current)", "[Coc] Fix current", mode = "n" }

					-- Remap keys for apply refactor code actions.
					normal_mappings["<leader>re"] =
						{ "<Plug>(coc-codeaction-refactor)", "[Coc] Refactor", mode = "n", silent = true }
					normal_mappings["<leader>r"] =
						{ "<Plug>(coc-codeaction-refactor-selected)", "give me description", mode = "x", silent = true }
					normal_mappings["<leader>r"] =
						{ "<Plug>(coc-codeaction-refactor-selected)", "give me description", mode = "n", silent = true }

					-- Run the Code Lens actions on the current line
					opts_mappings["<leader>cl"] = { "<Plug>(coc-codelens-action)", "give me description", mode = "n" }

					-- Map function and class text objects
					-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
					opts_mappings["if"] = { "<Plug>(coc-funcobj-i)", "which_key_ignore", mode = "x" }
					opts_mappings["if"] = { "<Plug>(coc-funcobj-i)", "which_key_ignore", mode = "o" }
					opts_mappings["af"] = { "<Plug>(coc-funcobj-a)", "which_key_ignore", mode = "x" }
					opts_mappings["af"] = { "<Plug>(coc-funcobj-a)", "which_key_ignore", mode = "o" }
					opts_mappings["ic"] = { "<Plug>(coc-classobj-i)", "which_key_ignore", mode = "x" }
					opts_mappings["ic"] = { "<Plug>(coc-classobj-i)", "which_key_ignore", mode = "o" }
					opts_mappings["ac"] = { "<Plug>(coc-classobj-a)", "which_key_ignore", mode = "x" }
					opts_mappings["ac"] = { "<Plug>(coc-classobj-a)", "which_key_ignore", mode = "o" }

					-- Remap <C-f> and <C-b> to scroll float windows/popups
					---@diagnostic disable-next-line: redefined-local
					wk.register(opts_mappings, opts)
					local opts_mappings = {}
					local opts = { silent = true, nowait = true, expr = true }
					opts_mappings["<C-f>"] =
						{ 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', "which_key_ignore", mode = "n" }
					opts_mappings["<C-b>"] =
						{ 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', "which_key_ignore", mode = "n" }
					opts_mappings["<C-f>"] = {
						'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"',
						"which_key_ignore",
						mode = "i",
					}
					opts_mappings["<C-b>"] = {
						'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"',
						"which_key_ignore",
						mode = "i",
					}
					opts_mappings["<C-f>"] =
						{ 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', "which_key_ignore", mode = "v" }
					opts_mappings["<C-b>"] =
						{ 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', "which_key_ignore", mode = "v" }

					-- Use CTRL-S for selections ranges
					-- Requires 'textDocument/selectionRange' support of language server
					normal_mappings["<C-s>"] =
						{ "<Plug>(coc-range-select)", "[Coc] Range select", mode = "n", silent = true }
					normal_mappings["<C-s>"] =
						{ "<Plug>(coc-range-select)", "[Coc] Range select", mode = "x", silent = true }

					-- Add `:Format` command to format current buffer
					vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

					-- " Add `:Fold` command to fold current buffer
					vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?" })

					-- Add `:OR` command for organize imports of the current buffer
					vim.api.nvim_create_user_command(
						"OR",
						"call CocActionAsync('runCommand', 'editor.action.organizeImport')",
						{}
					)

					-- Add (Neo)Vim's native statusline support
					-- NOTE: Please see `:h coc-status` for integrations with external plugins that
					-- provide custom statusline: lightline.vim, vim-airline
					vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

					-- Mappings for CoCList
					-- code actions and coc stuff
					---@diagnostic disable-next-line: redefined-local
					wk.register(opts_mappings, opts)
					local opts_mappings = {}
					local opts = { silent = true, nowait = true }
					-- Show all diagnostics
					opts_mappings["<space>a"] =
						{ ":<C-u>CocList diagnostics<cr>", "[Coc] List diagnostics", mode = "n" }
					-- Manage extensions
					opts_mappings["<space>e"] = { ":<C-u>CocList extensions<cr>", "[Coc] List extensions", mode = "n" }
					-- Show commands
					opts_mappings["<space>c"] = { ":<C-u>CocList commands<cr>", "[Coc] List commands", mode = "n" }
					-- Find symbol of current document
					opts_mappings["<space>o"] = { ":<C-u>CocList outline<cr>", "[Coc] List outline", mode = "n" }
					-- Search workspace symbols
					opts_mappings["<space>s"] = { ":<C-u>CocList -I symbols<cr>", "[Coc] List symbols", mode = "n" }
					-- Do default action for next item
					opts_mappings["<space>j"] = { ":<C-u>CocNext<cr>", "[Coc] Next", mode = "n" }
					-- Do default action for previous item
					opts_mappings["<space>k"] = { ":<C-u>CocPrev<cr>", "[Coc] Prev", mode = "n" }
					-- Resume latest coc list
					opts_mappings["<space>p"] = { ":<C-u>CocListResume<cr>", "[Coc] List Resume", mode = "n" }
					wk.register(opts_mappings, opts)
					wk.register(normal_mappings)
		end,
	},
}
