if exists('g:loaded_qalc')
	finish
endif
let g:loaded_qalc = 1

let g:qalc_mappings = get(g:, 'qalc_mappings', 1)
if g:qalc_mappings
	" Run the selection into a quickfix window (requires AsyncRun)
	vnoremap <leader>xq :call qalc#ToQuickfix()<CR>
	" Evaluate the selection and put it in the active register
	vnoremap <leader>xr :call qalc#ToRegister(v:register)<CR>
	" Evaluate the selection and replace it
	vnoremap <leader>xs :call qalc#Substitute()<CR>
	" Evaluate and overwrite the current word (cannot contain a space!)
	nnoremap <leader>x<leader> viW:call qalc#Substitute()<CR>
	" Evaluate the current word and put it in the " register
	nnoremap <leader>xx viW"":call qalc#ToRegister(v:register)<CR>
	" Open qalc in a terminal window
	noremap <leader>xt :term ++close qalc<CR>
endif
