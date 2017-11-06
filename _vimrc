source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif

" adding for bundle
endfunction
filetype off  
" 此处规定Vundle的路径  
set rtp+=$VIM/vimfiles/bundle/vundle/  
call vundle#rc('$VIM/vimfiles/bundle/')  
Bundle 'gmarik/vundle'  
filetype plugin indent on  
  
" original repos on github<br>Bundle 'mattn/zencoding-vim'  
" original repos on github

Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
"Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
"Bundle 'SirVer/ultisnips'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
" vim-scripts repos  
Bundle 'L9'  
Bundle 'FuzzyFinder'  
Bundle 'bufexplorer.zip'  
"Bundle 'taglist.vim'  
Bundle 'Mark'  
Bundle 'Calendar.vim'
"Bundle 'The-NERD-tree'  
Bundle 'matrix.vim'  
Bundle 'closetag.vim'  
Bundle 'The-NERD-Commenter'  
Bundle 'matchit.zip'  
Bundle 'AutoComplPop'  
Bundle 'jsbeautify'  
Bundle 'YankRing.vim'  
Bundle 'bling/vim-airline'
Bundle 'jceb/vim-orgmode'
Bundle 'guns/xterm-color-table.vim'
set laststatus=2
   
filetype plugin indent on     " required!   
set number
colorscheme desert
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set guifont=Courier_new:h13
set guioptions-=m " 隐藏菜单栏
set guioptions-=T " 隐藏工具栏

let mapleader=" "

nmap <Leader>y :YRShow<CR>

" FuzzyFinder
nnoremap <leader>f :FufFile<CR> 
nnoremap <leader>fb :FufBuffer<CR> 
nnoremap <leader>fl :FufLine<CR> 
nnoremap <leader>b<C-f> :FufBookmarkFileAdd<CR> 
nnoremap <leader>bf :FufBookmarkFile<CR> 
nnoremap <leader>b<C-d> :FufBookmarkDirAdd<CR> 
nnoremap <leader>bd :FufBookmarkDir<CR> 
nnoremap <leader>cl :FufChangeList<CR> 
nnoremap <leader>jl :FufJumpList<CR> 

set nowritebackup
set nobackup
set noswapfile

set smartindent  
set tabstop=4  
set shiftwidth=4  
set expandtab  
set softtabstop=4  
hi VimwikiHeader1 guifg=#FF0000 gui=bold
hi VimwikiHeader2 guifg=#00FF00 gui=bold 
hi VimwikiHeader3 guifg=#0000FF gui=bold 
hi VimwikiHeader4 guifg=#FF00FF gui=bold 
hi VimwikiHeader5 guifg=#00FFFF gui=bold 
hi VimwikiHeader6 guifg=#FFFF00 gui=bold 

hi VimwikiColor1 guifg=#ffcc33
hi VimwikiColor2 guifg=#ccff33
hi VimwikiColor3 guifg=#33ccff
hi VimwikiColor4 guifg=#ff33cc
hi VimwikiColor5 guifg=#cccccc
hi VimwikiColor6 guifg=#ff33ff
hi VimwikiColor7 guifg=#33ff33
hi VimwikiColor8 guifg=#ccffcc
hi VimwikiColor9 guifg=#aaffff
hi VimwikiColor10 guifg=#ffaaaa

hi VimwikiListAfter guifg=#ffcc33
hi VimwikiListAfter1 guifg=#ccff33
hi VimwikiListAfter2 guifg=#33ccff
hi VimwikiListAfter3 guifg=#ff33cc
hi VimwikiListAfter4 guifg=#cccccc
hi VimwikiListAfter5 guifg=#aa33ff
hi VimwikiListAfter6 guifg=#33ffcc
hi VimwikiListAfter7 guifg=#ff3333

let g:vimwiki_use_mouse = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_list_ignore_newline = 0 "换行
let g:vimwiki_html_header_numbering = 2
let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'javascript': 'javascript', 'java': 'java', 'sql': 'sql', 'xml': 'xml', 'html': 'html', 'bash': 'bash',}
let g:vimwiki_list = [wiki]
let g:vimwiki_diary_months = {
      \ 1: '一月', 2: '二月', 3: '三月',
      \ 4: '四月', 5: '五月', 6: '六月',
      \ 7: '七月', 8: '八月', 9: '九月',
      \ 10: '十月', 11: '十一月', 12: '十二月'
      \ }
nmap <leader>tt <Plug>VimwikiToggleListItem

" -----------------------------------------------------------------------------
"  << calendar-vim >>
" -----------------------------------------------------------------------------
let g:calendar_monday = 1           " 以星期一为开始
let g:calendar_focus_today = 1      " 光标在当天的日期上
"let g:calendar_mark = 'left-fit' "可以让*和数字可靠近
let g:calendar_mark = 'right' "上面设置后在昨天写日志，修改成right正常

set ignorecase
