function s:expandTypes(types)
  let l:expansion = ""
  let l:types = ['init'] + a:types

  for l:type in l:types
    let l:expansion .= "<C-r>=onetab#expand('".l:type."')<CR>"
  endfor

  return l:expansion
endfunction

if empty(mapcheck("\<Tab>", 'i'))
  let s:types = get(g:, 'onetab', ['tab', 'completefunc', 'omnifunc', 'file', 'keyword', 'dictionary'])

  execute "inoremap <silent><Tab> ".s:expandTypes(s:types)
endif

if empty(mapcheck("\<S-Tab>", 'i'))
  execute "inoremap <silent><S-Tab> ".s:expandTypes(['previous'])
endif
