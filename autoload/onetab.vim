let s:startingPosition = []

function! onetab#expand(type)
  let l:currentPosition = getcurpos()

  if a:type == 'start'
    let s:skipTheRest = 0
    if !pumvisible()
      let s:startingPosition = l:currentPosition
    endif

  elseif a:type == 'end'
    let s:startingPosition = []

  else
    if !s:skipTheRest
      if pumvisible()
        let s:skipTheRest = 1
        if a:type == 'previous'
          return "\<C-p>"
        endif

        return "\<C-n>"
      elseif (l:currentPosition == s:startingPosition)
        if a:type == 'tab' && strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
          return "\<Tab>"

        elseif a:type == 'completefunc' && &completefunc != ''
          return "\<C-x>\<C-u>"

        elseif a:type == 'omnifunc' && &omnifunc != ''
          return "\<C-x>\<C-o>"

        elseif a:type == 'include'
          return "\<C-x>\<C-i>"

        elseif a:type == 'keyword'
          return "\<C-p>"

        elseif a:type == 'dictionary'
          return "\<C-x>\<C-k>"
        endif
      endif
    endif
  endif

  return ''
endfunction
