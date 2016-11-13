# instalint.vim

Uses Vim's syntax highlighting to instantly bring out trailing whitespaces, tabs, duplicated word or any other regex.

## Installation

Assuming you have Pathogen up and running:

    $ cd ~/.vim/bundle
    $ git clone git://github.com/adaszko/instalint.vim

Add per-filetype configuration to your `.vimrc`:

```
let g:instalint_filetypes = { 'python': ['Tabs', 'TrailingSpaces', 'TrailingSemicolons'] }
```

where `python` is a some valid `'filetype'` option value and the list contains
names of highlighting groups.

## Author

Adam Szkoda <adaszko@gmail.com>

## License

BSD3
