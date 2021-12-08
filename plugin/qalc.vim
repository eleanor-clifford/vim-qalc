if exists('g:loaded_qalc')
	finish
endif
let g:loaded_qalc = 1

let g:qalc_mappings = get(g:, 'qalc_mappings', 1)
if g:qalc_mappings
	" Run into a quickfix window (requires AsyncRun)
	vnoremap <leader>xq    :call qalc#ToQuickfix()<CR>
	nnoremap <leader>xq viW:call qalc#ToQuickfix()<CR>

	" Evaluate and put it in the active register
	vnoremap <leader>xr    :call qalc#ToRegister(v:register)<CR>
	nnoremap <leader>xr viW:call qalc#ToRegister(v:register)<CR>

	" Evaluate and overwrite
	vnoremap <leader>x<leader>    :call qalc#Substitute()<CR>
	nnoremap <leader>x<leader> viW:call qalc#Substitute()<CR>

	" Evaluate and put it in the " register
	vnoremap <leader>xx      :call qalc#ToRegister(v:register)<CR>
	nnoremap <leader>xx viW"":call qalc#ToRegister(v:register)<CR>

	" Open qalc in a terminal window
	noremap <leader>xt :term ++close qalc<CR>
endif
