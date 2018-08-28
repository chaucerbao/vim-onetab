if empty(mapcheck("\<Tab>", 'i'))
  inoremap <silent><Tab> <C-r>=onetab#expand('start')<CR>
    \<C-r>=onetab#expand('tab')<CR>
    \<C-r>=onetab#expand('minisnip')<CR>
    \<C-r>=onetab#expand('completefunc')<CR>
    \<C-r>=onetab#expand('omnifunc')<CR>
    \<C-r>=onetab#expand('file')<CR>
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
