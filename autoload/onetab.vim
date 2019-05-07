function! onetab#expand(type)
  let l:currentPosition = getcurpos()

  if a:type == 'init'
    let s:startingPosition = []
    let s:skipTheRest = 0

    if !pumvisible()
      let s:startingPosition = l:currentPosition
    endif

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

        elseif a:type == 'minisnip' && g:loaded_minisnip == 1
          if (minisnip#ShouldTrigger())
            return "\<Esc>:call \minisnip#Minisnip()\<CR>"
          endif
          return ""

        elseif a:type == 'completefunc' && &completefunc != ''
          return "\<C-x>\<C-u>"

        elseif a:type == 'omnifunc' && &omnifunc != ''
          return "\<C-x>\<C-o>"

        elseif a:type == 'file' && getline('.')[col('.') - 2] !~ '\s'
          return "\<C-x>\<C-f>"

        elseif a:type == 'include'
          return "\<C-x>\<C-i>"

        elseif a:type == 'keyword'
          return "x\<BS>\<C-p>"

        elseif a:type == 'dictionary'
          return "\<C-x>\<C-k>"
        endif
      endif
    endif
  endif

  return ''
endfunction
