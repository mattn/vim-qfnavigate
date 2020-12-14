function! qfnavigate#next() abort
  try
    let l:tabnr = tabpagenr()
    for l:info in filter(getwininfo(), {k, v -> v.tabnr == l:tabnr })
      if l:info.loclist
        lnext
      elseif l:info.quickfix
        cnext
      endif
    endfor
  catch
    echomsg matchstr(v:exception, '^[^:]\+:\zs.*')
  endtry
endfunction

function! qfnavigate#previous() abort
  try
    let l:tabnr = tabpagenr()
    for l:info in filter(getwininfo(), {k, v -> v.tabnr == l:tabnr })
      if l:info.loclist
        lprevious
      elseif l:info.quickfix
        cprevious
      endif
    endfor
  catch
    echomsg matchstr(v:exception, '^[^:]\+:\zs.*')
  endtry
endfunction
