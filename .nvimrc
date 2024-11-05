version 6.0
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <Plug>(coc-snippets-expand-jump) coc#_insert_key('request', 'coc-snippets-expand-jump', 1)
inoremap <silent> <expr> <Plug>(coc-snippets-expand) coc#_insert_key('request', 'coc-snippets-expand', 1)
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <nowait> <silent> <expr> <C-B> coc#float#has_scroll() ? "=coc#float#scroll(0)" : "<Left>"
inoremap <nowait> <silent> <expr> <C-F> coc#float#has_scroll() ? "=coc#float#scroll(1)" : "<Right>"
inoremap <silent> <expr> <C-Space> coc#refresh()
inoremap <C-J> <Plug>(coc-snippets-expand-jump)
inoremap <silent> <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\"
inoremap <silent> <expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"
inoremap <silent> <expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
inoremap <silent> <expr> <C-Y> coc#pum#visible() ? coc#pum#confirm() : "\"
inoremap <silent> <expr> <C-E> coc#pum#visible() ? coc#pum#cancel() : "\"
inoremap <silent> <expr> <Up> coc#pum#visible() ? coc#pum#prev(0) : "\<Up>"
inoremap <silent> <expr> <Down> coc#pum#visible() ? coc#pum#next(0) : "\<Down>"
inoremap <silent> <expr> <C-P> coc#pum#visible() ? coc#pum#prev(1) : "\"
inoremap <silent> <expr> <C-N> coc#pum#visible() ? coc#pum#next(1) : "\"
inoremap <C-W> u
inoremap <C-U> u
vnoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? coc#float#scroll(0) : ""
nnoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? coc#float#scroll(0) : ""
vnoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? coc#float#scroll(1) : ""
nnoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? coc#float#scroll(1) : ""
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
xnoremap <silent>  <Plug>(coc-range-select)
nnoremap <silent>  <Plug>(coc-range-select)
nmap  d
tnoremap  
nnoremap <silent>  oh :OhneAccidents
nnoremap  bf :Neotree buffers reveal float
nnoremap  nn :Neotree filesystem reveal right
nnoremap  nc :Neotree close
nnoremap <nowait> <silent>  p :CocListResume
nnoremap <nowait> <silent>  j :CocNext
nnoremap <nowait> <silent>  s :CocList -I symbols
nnoremap <nowait> <silent>  o :CocList outline
nnoremap <nowait> <silent>  c :CocList commands
nnoremap <nowait> <silent>  e :CocList extensions
nnoremap <nowait> <silent>  cl <Plug>(coc-codelens-action)
nnoremap <silent>  r <Plug>(coc-codeaction-refactor-selected)
xnoremap <silent>  r <Plug>(coc-codeaction-refactor-selected)
nnoremap <silent>  re <Plug>(coc-codeaction-refactor)
nnoremap <nowait> <silent>  qf <Plug>(coc-fix-current)
nnoremap <nowait> <silent>  as <Plug>(coc-codeaction-source)
nnoremap <nowait> <silent>  ac <Plug>(coc-codeaction-cursor)
nnoremap <nowait> <silent>  a :CocList diagnostics
xnoremap <nowait> <silent>  a <Plug>(coc-codeaction-selected)
nnoremap <silent>  rn <Plug>(coc-rename)
nmap  lh <Cmd>lua vim.lsp.buf.signature_help()
nmap  ld <Cmd>lua vim.lsp.buf.document_symbol()
nmap  li <Cmd>lua vim.lsp.buf.implementation()
nmap  lrr <Cmd>lua vim.lsp.buf.references()
nmap  la <Cmd>lua vim.lsp.buf.code_action()
nmap  ln <Cmd>lua vim.lsp.buf.rename()
nmap   l
nmap  wq :wq:qa
nnoremap <silent>  fq :wqa
nnoremap <silent>  fw :w
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nmap < v<
nmap > v>
xnoremap <silent> <expr> @ mode() ==# 'V' ? ':normal! @'.getcharstr().'' : '@'
nnoremap <silent> K <Cmd>lua _G.show_docs()
xnoremap <silent> <expr> Q mode() ==# 'V' ? ':normal! @=reg_recorded()' : 'Q'
nmap T <Cmd>BufferPrevious
nnoremap Y y$
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> \l l
nnoremap <silent> \k k
nnoremap <silent> \h h
nnoremap <silent> \j j
nnoremap <silent> \ml l
nnoremap <silent> \mk K
nnoremap <silent> \mh H
nnoremap <silent> \mr r
nnoremap <silent> \mj J
nnoremap <silent> \wh 
nnoremap <silent> \wv 
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
xmap a% <Plug>(MatchitVisualTextObject)
onoremap <nowait> <silent> ac <Plug>(coc-classobj-a)
xnoremap <nowait> <silent> ac <Plug>(coc-classobj-a)
onoremap <nowait> <silent> af <Plug>(coc-funcobj-a)
xnoremap <nowait> <silent> af <Plug>(coc-funcobj-a)
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gd <Plug>(coc-definition)
onoremap <nowait> <silent> ic <Plug>(coc-classobj-i)
xnoremap <nowait> <silent> ic <Plug>(coc-classobj-i)
onoremap <nowait> <silent> if <Plug>(coc-funcobj-i)
xnoremap <nowait> <silent> if <Plug>(coc-funcobj-i)
nnoremap tc :tabclose
nmap tp <Cmd>BufferPrevious
nmap tn <Cmd>BufferNext
vnoremap <silent> <Plug>(coc-snippets-select) :call coc#rpc#notify('doKeymap', ['coc-snippets-select'])
xnoremap <silent> <Plug>(coc-convert-snippet) :call coc#rpc#notify('doKeymap', ['coc-convert-snippet'])
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <F5> :lua require"osv".launch({port = 8086})
nnoremap <F12> :lua require"dap.ui.widgets".hover()
nnoremap <S-F10> :lua require"dap".step_into()
nnoremap <F10> :lua require"dap".step_over()
nnoremap <F9> :lua require"dap".continue()
nnoremap <F8> :lua require"dap".toggle_breakpoint()
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))
xnoremap <silent> <C-S> <Plug>(coc-range-select)
nnoremap <silent> <C-S> <Plug>(coc-range-select)
vnoremap <nowait> <silent> <expr> <C-B> coc#float#has_scroll() ? coc#float#scroll(0) : ""
vnoremap <nowait> <silent> <expr> <C-F> coc#float#has_scroll() ? coc#float#scroll(1) : ""
nnoremap <nowait> <silent> <expr> <C-B> coc#float#has_scroll() ? coc#float#scroll(0) : ""
nnoremap <nowait> <silent> <expr> <C-F> coc#float#has_scroll() ? coc#float#scroll(1) : ""
onoremap <silent> <Plug>(coc-classobj-a) :call CocAction('selectSymbolRange', v:false, '', ['Interface', 'Struct', 'Class'])
onoremap <silent> <Plug>(coc-classobj-i) :call CocAction('selectSymbolRange', v:true, '', ['Interface', 'Struct', 'Class'])
vnoremap <silent> <Plug>(coc-classobj-a) :call CocAction('selectSymbolRange', v:false, visualmode(), ['Interface', 'Struct', 'Class'])
vnoremap <silent> <Plug>(coc-classobj-i) :call CocAction('selectSymbolRange', v:true, visualmode(), ['Interface', 'Struct', 'Class'])
onoremap <silent> <Plug>(coc-funcobj-a) :call CocAction('selectSymbolRange', v:false, '', ['Method', 'Function'])
onoremap <silent> <Plug>(coc-funcobj-i) :call CocAction('selectSymbolRange', v:true, '', ['Method', 'Function'])
vnoremap <silent> <Plug>(coc-funcobj-a) :call CocAction('selectSymbolRange', v:false, visualmode(), ['Method', 'Function'])
vnoremap <silent> <Plug>(coc-funcobj-i) :call CocAction('selectSymbolRange', v:true, visualmode(), ['Method', 'Function'])
nnoremap <silent> <Plug>(coc-cursors-position) :call CocAction('cursorsSelect', bufnr('%'), 'position', 'n')
nnoremap <silent> <Plug>(coc-cursors-word) :call CocAction('cursorsSelect', bufnr('%'), 'word', 'n')
vnoremap <silent> <Plug>(coc-cursors-range) :call CocAction('cursorsSelect', bufnr('%'), 'range', visualmode())
nnoremap <silent> <Plug>(coc-refactor) :call       CocActionAsync('refactor')
nnoremap <silent> <Plug>(coc-command-repeat) :call       CocAction('repeatCommand')
nnoremap <silent> <Plug>(coc-float-jump) :call       coc#float#jump()
nnoremap <silent> <Plug>(coc-float-hide) :call       coc#float#close_all()
nnoremap <silent> <Plug>(coc-fix-current) :call       CocActionAsync('doQuickfix')
nnoremap <silent> <Plug>(coc-openlink) :call       CocActionAsync('openLink')
nnoremap <silent> <Plug>(coc-references-used) :call       CocActionAsync('jumpUsed')
nnoremap <silent> <Plug>(coc-references) :call       CocActionAsync('jumpReferences')
nnoremap <silent> <Plug>(coc-type-definition) :call       CocActionAsync('jumpTypeDefinition')
nnoremap <silent> <Plug>(coc-implementation) :call       CocActionAsync('jumpImplementation')
nnoremap <silent> <Plug>(coc-declaration) :call       CocActionAsync('jumpDeclaration')
nnoremap <silent> <Plug>(coc-definition) :call       CocActionAsync('jumpDefinition')
nnoremap <silent> <Plug>(coc-diagnostic-prev-error) :call       CocActionAsync('diagnosticPrevious', 'error')
nnoremap <silent> <Plug>(coc-diagnostic-next-error) :call       CocActionAsync('diagnosticNext',     'error')
nnoremap <silent> <Plug>(coc-diagnostic-prev) :call       CocActionAsync('diagnosticPrevious')
nnoremap <silent> <Plug>(coc-diagnostic-next) :call       CocActionAsync('diagnosticNext')
nnoremap <silent> <Plug>(coc-diagnostic-info) :call       CocActionAsync('diagnosticInfo')
nnoremap <silent> <Plug>(coc-format) :call       CocActionAsync('format')
nnoremap <silent> <Plug>(coc-rename) :call       CocActionAsync('rename')
nnoremap <Plug>(coc-codeaction-source) :call       CocActionAsync('codeAction', '', ['source'], v:true)
nnoremap <Plug>(coc-codeaction-refactor) :call       CocActionAsync('codeAction', 'cursor', ['refactor'], v:true)
nnoremap <Plug>(coc-codeaction-cursor) :call       CocActionAsync('codeAction', 'cursor')
nnoremap <Plug>(coc-codeaction-line) :call       CocActionAsync('codeAction', 'currline')
nnoremap <Plug>(coc-codeaction) :call       CocActionAsync('codeAction', '')
vnoremap <Plug>(coc-codeaction-refactor-selected) :call       CocActionAsync('codeAction', visualmode(), ['refactor'], v:true)
vnoremap <silent> <Plug>(coc-codeaction-selected) :call       CocActionAsync('codeAction', visualmode())
vnoremap <silent> <Plug>(coc-format-selected) :call       CocActionAsync('formatSelected', visualmode())
nnoremap <Plug>(coc-codelens-action) :call       CocActionAsync('codeLensAction')
nnoremap <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     '', v:true)
vnoremap <silent> <Plug>(coc-range-select-backward) :call       CocActionAsync('rangeSelect',     visualmode(), v:false)
vnoremap <silent> <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     visualmode(), v:true)
nmap <C-W><C-D> d
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? "=coc#float#scroll(0)" : "<Left>"
inoremap <silent> <expr>  coc#pum#visible() ? coc#pum#cancel() : "\"
inoremap <nowait> <silent> <expr>  coc#float#has_scroll() ? "=coc#float#scroll(1)" : "<Right>"
inoremap <silent> <expr> 	 coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "	" : coc#refresh()
inoremap <NL> <Plug>(coc-snippets-expand-jump)
inoremap <silent> <expr>  coc#pum#visible() ? coc#pum#confirm() : "\u\\=coc#on_enter()\"
inoremap <silent> <expr>  coc#pum#visible() ? coc#pum#next(1) : "\"
inoremap <silent> <expr>  coc#pum#visible() ? coc#pum#prev(1) : "\"
inoremap  u
inoremap  u
inoremap <silent> <expr>  coc#pum#visible() ? coc#pum#confirm() : "\"
imap jk 
let &cpo=s:cpo_save
unlet s:cpo_save
set expandtab
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ -uu\ 
set helplang=en
set noloadplugins
set packpath=/opt/nvim/share/nvim/runtime
set runtimepath=~/.config/nvim,~/.local/share/nvim/lazy/lazy.nvim,~/.local/share/nvim/lazy/dashboard-nvim,~/.local/share/nvim/lazy/ohne-accidents,~/.local/share/nvim/lazy/presence.nvim,~/.local/share/nvim/lazy/vim-snippets,~/.local/share/nvim/lazy/hacker.nvim,~/.local/share/nvim/lazy/nvim-dap,~/.local/share/nvim/lazy/nvimesweeper,~/.local/share/nvim/lazy/nvim-nio,~/.local/share/nvim/lazy/kanagawa.nvim.git,~/.local/share/nvim/lazy/one-small-step-for-vimkind,~/.local/share/nvim/lazy/barbar.nvim,~/.local/share/nvim/lazy/conform.nvim,~/.local/share/nvim/lazy/nvim-colorizer.lua,~/.local/share/nvim/lazy/vim-repeat,~/.local/share/nvim/lazy/lua-utils.nvim,~/.local/share/nvim/lazy/lualine-time,~/.local/share/nvim/lazy/lualine.nvim,~/.local/share/nvim/lazy/gitsigns.nvim,~/.local/share/nvim/lazy/telescope.nvim,~/.local/share/nvim/lazy/nui.nvim,~/.local/share/nvim/lazy/nvim-web-devicons,~/.local/share/nvim/lazy/plenary.nvim,~/.local/share/nvim/lazy/neo-tree.nvim,~/.local/share/nvim/lazy/indent-blankline.nvim,~/.local/share/nvim/lazy/pathlib.nvim,~/.local/share/nvim/lazy/quickmath.nvim,~/.local/share/nvim/lazy/telescope-ui-select.nvim,~/.local/share/nvim/lazy/which-key.nvim,~/.local/share/nvim/lazy/coc.nvim,~/.local/share/nvim/lazy/nvim-treesitter,~/.local/share/nvim/lazy/nvim-ts-autotag,~/.local/share/nvim/lazy/gruvbox.nvim,~/.local/share/nvim/lazy/luarocks.nvim,~/.local/share/nvim/lazy/catppuccin,/opt/nvim/share/nvim/runtime,/opt/nvim/share/nvim/runtime/pack/dist/opt/matchit,/opt/nvim/lib/nvim,~/.local/state/nvim/lazy/readme,~/.local/share/nvim/lazy/indent-blankline.nvim/after,~/.local/share/nvim/lazy/catppuccin/after,~/.config/coc/extensions/node_modules/coc-snippets
set shiftwidth=2
set showtabline=2
set softtabstop=2
set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}
set tabline=%1@barbar#events#main_click_handler@%#BufferVisibleSign#▎%#BufferVisible#\ \ \ \ %#DevIconLuaVisible#\ %1@barbar#events#main_click_handler@%#BufferVisible#init.lua%#BufferVisible#\ \ \ \ %1@barbar#events#close_click_handler@%#BufferVisibleBtn#\ %1@barbar#events#main_click_handler@%#BufferVisibleSignRight#%12@barbar#events#main_click_handler@%#BufferInactiveSign#▎%#BufferInactive#\ \ \ \ %#BufferInactive#\ %12@barbar#events#main_click_handler@%#BufferInactive#[buffer\ 12]%#BufferInactive#\ \ \ \ %12@barbar#events#close_click_handler@%#BufferInactiveBtn#\ %12@barbar#events#main_click_handler@%#BufferInactiveSignRight#%#BufferInactiveSign#▎%#BufferTabpageFill#\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ %0@barbar#events#main_click_handler@%#BufferTabpages#\ 2%#BufferTabpagesSep#/%#BufferTabpages#2\ %#BufferTabpageFill#
set tabstop=2
set termguicolors
set updatetime=300
set window=69
set nowritebackup
" vim: set ft=vim :
