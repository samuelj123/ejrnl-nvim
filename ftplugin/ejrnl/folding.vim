setlocal foldmethod=expr
setlocal foldexpr=Ejrnlfold(v:lnum)
set foldtext=MyFoldText()

function! Ejrnlfold(lnum)
    let l:cur_line = getline(a:lnum)
    let l:next_line = getline(a:lnum+1)

    if l:cur_line =~# '^#'
        return '>' . (matchend(l:cur_line, '^#*') )
    else
        if l:cur_line ==# '' && (matchend(l:next_line, '^#*') -1 ) == 1
            return 0
				elseif l:cur_line =~# '^TODO:\|^DONE:\|^FAIL:'
						return 0
        else
            return '='
        endif
    endif
endfunction

function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
    return  line_text . repeat('.', fillcharcount-10) . ' (' . folded_line_num . ' L)'
endfunction
