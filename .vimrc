" dir
" ~/.vim
"   |-- after
"   |-- backup
"   `-- bundle

"---------------------------------------------------------------------------
" vundle
" $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" common
Bundle 'gmarik/vundle'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neomru.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'teramako/jscomplete-vim'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'vim-scripts/Highlight-UnMatched-Brackets'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-surround'
" colorscheme
Bundle 'molokai'
Bundle 'Solarized'


filetype plugin indent on

"---------------------------------------------------------------------------
" colorscheme
"

set t_Co=256
syntax on
"set background=dark
colorscheme molokai



"---------------------------------------------------------------------------
" file
"

" complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

au BufRead,BufNewFile *.scss set filetype=sass

" encoding
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif


" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" backup
set backup
set backupdir=~/.vim/backup

" WhitespaceEOL
highlight WhitespaceEOL ctermbg=gray guibg=gray
match WhitespaceEOL /\s\+$/

" buffer
set hidden

"---------------------------------------------------------------------------
" motion
"

" tab & indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" cmd
set showcmd

" BS
set backspace=indent,eol,start

" ESC
inoremap <C-j> <esc>
inoremap jj <esc>

" search highlight
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" repeated indent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" vimgrep
autocmd QuickfixCmdPost vimgrep cw

"---------------------------------------------------------------------------
" plugin
"

let g:neocomplcache_enable_at_startup = 1
" neocomplecache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1

" unite
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>

" vim-powerline
set laststatus=2
"let g:Powerline_symbols = 'fancy'

" vcscommand.vim
command! SD :VCSVimDiff

" multi cursor
let g:multi_cursor_use_default_mapping=0

let g:cssColorVimDoNotMessMyUpdatetime = 1

" emmet > ctrl + e
 let g:user_emmet_expandabbr_key = '<c-e>'
