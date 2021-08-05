" dir
" ~/.vim
"   |-- backup
"   `-- bundle

"dein Scripts-----------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/dotfiles/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})
  "call dein#load_toml(s:denite_lazy, {'lazy': 1})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

" Required:
filetype plugin indent on
" syntax enable

"End dein Scripts-------------------------

"set nocompatible
"filetype plugin indent off
"
"if has('vim_starting')
"  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
"endif
"
"call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
"
"" Let NeoBundle manage NeoBundle
"NeoBundleFetch 'Shougo/neobundle.vim'
"
"" My Bundles here:
"" common
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/neoyank.vim'
"NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'vim-scripts/vcscommand.vim'
"NeoBundle 'vim-scripts/Highlight-UnMatched-Brackets'
"NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'kchmck/vim-coffee-script'
"NeoBundle 'mattn/emmet-vim'
"NeoBundle 'tpope/vim-surround'
"NeoBundle 'The-NERD-tree'
"NeoBundle 'The-NERD-Commenter'
"NeoBundle 'Gist.vim'
"NeoBundle 'cakebaker/scss-syntax.vim'
"NeoBundle 'slim-template/vim-slim'
"" colorscheme
"NeoBundle 'molokai'
"NeoBundle 'Solarized'
"
"call neobundle#end()
"
"filetype plugin indent on

"---------------------------------------------------------------------------
" colorscheme
"
syntax on
"set background=dark
set t_Co=256
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

" swapfile
set swapfile
set directory=~/.vim/tmp

" backup
set backup
set backupdir=~/.vim/backup

" whitespace
autocmd BufWritePre * :%s/\s\+$//e

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

"let g:neocomplcache_enable_at_startup = 1
" neocomplecache
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_underbar_completion = 1
"
"" unite
"nnoremap <silent> ,b :<C-u>Unite buffer<CR>
"nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
"nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
"nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"nnoremap <silent> ,y :<C-u>Unite history/yank<CR>

" vim-powerline
"set laststatus=2
"let g:Powerline_symbols = 'fancy'

" vcscommand.vim
command! SD :VCSVimDiff

" multi cursor
let g:multi_cursor_use_default_mapping=0

let g:cssColorVimDoNotMessMyUpdatetime = 1

" emmet > ctrl + e
 let g:user_emmet_expandabbr_key = '<c-e>'
