" ---------------------------------------------
" Dave Eddy's vimrc
" dave@daveeddy.com
" License MIT
"
" Credits
"   https://github.com/Happy-Dude/
" ---------------------------------------------
set nocompatible		" Disable VI Compatibility

" ---------------------------------------------
" Init - pathogen
" ---------------------------------------------
filetype off			" Turn filetype plugin off until Pathogen loads

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on

" ---------------------------------------------
" Vim Options
" ---------------------------------------------
set autoindent			" Default to indenting files
set backspace=indent,eol,start	" Backspace all characters
set hlsearch			" Highlight search results
set nonumber			" Disable line numbers
set nostartofline		" Do not jump to first character with page commands
set ruler			" Enable the ruler
set showmatch			" Show matching brackets.
set showmode			" Show the current mode in status line
set showcmd			" Show partial command in status line
set tabstop=8			" Number of spaces <tab> counts for
set textwidth=80		" 80 Columns
set title			" Set the title

" ---------------------------------------------
" Theme / Color Scheme
" ---------------------------------------------
set background=light            " Light background is best

" ---------------------------------------------
" Abbreviations
" ---------------------------------------------
iab <expr> me:: strftime("Author: Dave Eddy <dave@daveeddy.com><cr>Date: %B %d, %Y<cr>License: MIT")

" ---------------------------------------------
" Aliases
" ---------------------------------------------
cmap w!! w !sudo tee > /dev/null %

" ---------------------------------------------
" File/Indenting and Syntax Highlighting
" ---------------------------------------------
if has("autocmd")
	filetype plugin indent on

	" Jump to previous cursor location, unless it's a commit message
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg"

	" Chef/Ruby
	autocmd BufNewFile,BufRead                  *.rb setlocal filetype=ruby
	autocmd FileType                            ruby setlocal sw=2 sts=2 et

	" Yaml
	autocmd BufNewFile,BufRead                  *.yaml,*.yml setlocal filetype=yaml
	autocmd FileType                            yaml         setlocal sw=2 sts=2 et

	" JavaScript files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.js setlocal filetype=javascript
	autocmd FileType                            javascript  setlocal sw=4 sts=4 et

	" JSON files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.json setlocal filetype=javascript
	autocmd FileType                            json  setlocal sw=2 sts=2 et

	" Objective C / C++
	autocmd BufNewFile,BufReadPre,FileReadPre   *.m    setlocal filetype=objc
	autocmd FileType                            objc   setlocal sw=4 sts=4 et
	autocmd BufNewFile,BufReadPre,FileReadPre   *.mm   setlocal filetype=objcpp
	autocmd FileType                            objcpp setlocal sw=4 sts=4 et

	" Python files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.py   setlocal filetype=python
	autocmd FileType                            python setlocal sw=4 sts=4 et

	" Markdown files
	autocmd BufNewFile,BufRead,FileReadPre      *.md,*.markdown setlocal filetype=ghmarkdown
	autocmd FileType                            ghmarkdown      setlocal sw=4 sts=4 et spell
	" Jekyll posts ignore yaml headers
	autocmd BufNewFile,BufRead                  */_posts/*.md syntax match Comment /\%^---\_.\{-}---$/
	autocmd BufNewFile,BufRead                  */_posts/*.md syntax region lqdHighlight start=/^{%\s*highlight\(\s\+\w\+\)\{0,1}\s*%}$/ end=/{%\s*endhighlight\s*%}/

	" EJS javascript templates
	autocmd BufNewFile,BufRead,FileReadPre      *.ejs setlocal filetype=html

	" TXT files
	autocmd FileType                            text setlocal spell
endif

" ---------------------------------------------
" Highlight Unwanted Whitespace
" ---------------------------------------------
highlight RedundantWhitespace ctermbg=green guibg=green
match RedundantWhitespace /\s\+$\| \+\ze\t/

" ---------------------------------------------
" Spell Check Settings
" ---------------------------------------------
set spelllang=en
highlight clear SpellBad
highlight SpellBad term=standout cterm=underline ctermfg=red
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" ---------------------------------------------
" Plugins
" ---------------------------------------------
let g:airline_theme = "deus"

" ---------------------------------------------
" Source local config
" ---------------------------------------------
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
if filereadable(expand("~/.vimrc.indent"))
	source ~/.vimrc.indent
endif
