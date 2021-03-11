fun! qalc#Evaluate(expr)
	return system("qalc -t '".a:expr."'|tr -d '\n'")
endfun

fun! qalc#Substitute()
	let start = getpos("'<")[1:2]
	let end   = getpos("'>")[1:2]
	let res = qalc#Evaluate(s:get_visual_selection())
	call cursor(start)
	norm! v
	call cursor(end)
	execute 'norm! c'.res
endfun

fun! qalc#ToQuickfix()
	let pos = getpos("'>")[1:2]
	execute 'AsyncRun qalc '."'".s:get_visual_selection()."'"
	call cursor(pos)
endfun

fun! qalc#ToRegister(reg)
	let pos = getpos("'>")[1:2]
	let res = qalc#Evaluate(s:get_visual_selection())
	call setreg(a:reg, res)
	call cursor(pos)
endfun

fun! s:get_visual_selection()
	" public domain code by stack overflow user FocusedWolf
	" https://stackoverflow.com/a/6271254
	" Why is this not a built-in Vim script function?!
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	let lines = getline(line_start, line_end)
	if len(lines) == 0
		return ''
	endif
	let lines[-1] = lines[-1][:column_end - (&selection == 'inclusive' ? 1 : 2)]
	let lines[0] = lines[0][column_start - 1:]
	return join(lines, "\n")
endfun
