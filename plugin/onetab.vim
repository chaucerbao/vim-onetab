if empty(mapcheck("\<Tab>", 'i'))
  let g:onetab = get(g:, 'onetab', ['tab', 'minisnip', 'completefunc', 'omnifunc', 'file', 'include', 'keyword', 'dictionary'])

  let expansion = ""
  for type in g:onetab
    let expansion .= "<C-r>=onetab#expand('".type."')<CR>"
  endfor

  execute "
    \inoremap <silent><Tab> <C-r>=onetab#expand('start')<CR>
      \".expansion."
      \<C-r>=onetab#expand('end')<CR>
  \"
endif

if empty(mapcheck("\<S-Tab>", 'i'))
  inoremap <silent><S-Tab> <C-r>=onetab#expand('start')<CR>
    \<C-r>=onetab#expand('previous')<CR>
    \<C-r>=onetab#expand('end')<CR>
endif
