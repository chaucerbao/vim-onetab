# OneTab

Vim already has several powerful, built-in completion functions. But, when you want to use them, you need to think about which completion function you want to invoke (depending on your context) and recall the key combination for that completion. OneTab does that thinking for you and puts that power into the `<Tab>` key.

## Usage

You can customize the order of expansion

```
let g:onetab = ['tab', 'minisnip', 'completefunc', 'omnifunc', 'file', 'include', 'keyword', 'dictionary']
```

## Acknowledgement
OneTab is based on the approach taken by [vim-clevertab].

[vim-clevertab]: https://github.com/neitanod/vim-clevertab
