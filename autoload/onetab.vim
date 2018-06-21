let s:startingPosition = []

function! onetab#expand(type)
  let l:currentPosition = getcurpos()
  let l:hasCursorMoved = (l:currentPosition == s:startingPosition) ? 0 : 1

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
      elseif !l:hasCursorMoved
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

if empty(mapcheck("\<Tab>", 'i'))
  inoremap <silent><Tab> <C-r>=onetab#expand('start')<CR>
    \<C-r>=onetab#expand('tab')<CR>
    \<C-r>=onetab#expand('completefunc')<CR>
    \<C-r>=onetab#expand('omnifunc')<CR>
    \<C-r>=onetab#expand('include')<CR>
    \<C-r>=onetab#expand('keyword')<CR>
    \<C-r>=onetab#expand('dictionary')<CR>
    \<C-r>=onetab#expand('end')<CR>
endif

if empty(mapcheck("\<S-Tab>", 'i'))
  inoremap <silent><S-Tab> <C-r>=onetab#expand('start')<CR>
    \<C-r>=onetab#expand('previous')<CR>
    \<C-r>=onetab#expand('end')<CR>
endif
