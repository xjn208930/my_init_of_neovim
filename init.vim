call plug#begin('~/.config/nvim/plugged')
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'hzchirs/vim-material'
Plug 'ajmwagar/vim-deus'
Plug 'mhinz/vim-startify'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tmhedberg/SimpylFold'
Plug 'terryma/vim-multiple-cursors'
Plug 'dhruvasagar/vim-table-mode'
Plug 'brooth/far.vim'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'greyblake/vim-preview'
Plug 'iamcco/markdown-preview.vim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'joshdick/onedark.vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'voldikss/vim-translator'
call plug#end()

set t_Co=256
set termguicolors 
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
map <silent> gd <Plug>(coc-definition)
let g:airline_theme='material'
set background=dark
let g:deus_termcolors=256
let g:neoterm_autoscroll=1
autocmd TermOpen term://* startinsert 
silent !mkdir -p ~/.config/nvim/tmp/backup 
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif
nmap <F2> :TagbarToggle<CR>
map ly :CocList yank<CR>
hi semshiLocal ctermfg=209 guifg=#ff875f
hi semshiGlobal ctermfg=214 guifg=#ffaf00
hi semshiImported ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter ctermfg=75 guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree ctermfg=218 guifg=#ffafd7
hi semshiBuiltin ctermfg=207 guifg=#ff5fff
hi semshiAttribute ctermfg=49 guifg=#00ffaf
hi semshiSelf ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
hi semshiErrorSign ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
"sign define semshiError text=E> texthl=semshiErrorSign
let g:table_mode_corner = '|'
let g:table_mode_delimiter = ' '
let g:mkdp_path_to_chrome = "google-chrome"
let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:SimpylFold_docstring_preview = 1
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let NERDTreeShowHidden=1
set encoding=UTF-8
imap <C-w> <Plug>(coc-snippets-expand)
vmap <C-q> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
au BufReadPost * if line("'\"")>1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
noremap <C-a> za
map . $
map <F1> :call Run()<CR>
func! Run()
    exec "w"
    if &filetype == 'python'
        set splitright
        :sp
        :term python %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    endif
endfunc
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
let mapleader=" "
let g:user_emmet_leader_key='Z'
let g:coc_global_extensions = ['coc-vimlsp', 'coc-pyls', 'coc-html','coc-tsserver', 'coc-snippets']
if exists('b:haveRemappedT')
    finish
endif
let b:haveRemappedT=1
let s:oldmap=maparg('T', 'n')
function! s:LastTab()
    let tab=tabpagenr()
    tabnext
    execute "tabmove ".tabpagenr('$')
    execute "tabn ".tab
endfunction
execute 'nnoremap <buffer> T '.s:oldmap.':call <SID>LastTab()<CR>'
let NERDTreeWinPos="right"
sign define semshiError text=E> texthl=semshiErrorSign
let g:coc_disable_startup_warning = 1
let g:mkdp_browser = 'google-chrome'
map f :F  %<left><left>
map rn <Plug>(coc-rename)
map R :source $MYVIMRC<CR>
map S :w<CR>
map Q :q<CR>
map <C-right> :set splitright<CR>:vsplit<CR>
map <C-left> :set nosplitright<CR>:vsplit<CR>
map <C-down> :set splitbelow<CR>:split<CR>
map <C-up> :set nosplitbelow<CR>:split<CR>
map <Leader>6 <C-w>l
map <Leader>8 <C-w>k
map <Leader>2 <C-w>j
map <leader>4 <C-w>h
map <C-k> :res -5<CR>
map <C-j> :res +5<CR>
map <C-h> :vertical resize+5<CR>
map <C-l> :vertical resize-5<CR>
map <C-t> :tabe<CR>
nnoremap <s-tab> :-tabnext<CR>
nnoremap <tab> :+tabnext<CR>
nmap ne :NERDTreeToggle<CR>
map li :UndotreeToggle<CR>
map t :te<CR>
nmap T <Plug>TranslateW
vmap T <Plug>TranslateWV
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store', 'tags', '\idea$']
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction
map <leader>t :call OpenFloatingWin()<CR>
map \ :CocCommand<CR>
let $FZF_DEFAULT_OPTS = '--layout=reverse' " 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
set showtabline=2
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
set nocompatible
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set expandtab
set list
set updatetime=1
set autochdir
set tabline=%!MyTabLine()
set lazyredraw
set shiftwidth=4
set foldmethod=manual
set foldlevel=100
set tabstop=4
set listchars=tab:>-,trail:-
set encoding=utf-8
set mouse=a
set scrolloff=5
set backspace=2
set smartindent
set noswapfile
set modifiable
set textwidth=79
set expandtab
set autoindent
syntax on
exec "nohlsearch"
colorscheme quantum
if &filetype == 'markdown'
    nmap <silent> <F2> :Toc<CR>
    nmap <silent> <F3> :MarkdownPreviewStop<CR>
endif  

function! MyTabLabel(n)
    let label = ''
    let buflist = tabpagebuflist(a:n)
    for bufnr in buflist
        if getbufvar(bufnr, '&modified')
            let label = '+'
            break
        endif
    endfor
    let label .= a:n . ' '
    let winnr = tabpagewinnr(a:n)
    let name = bufname(buflist[winnr - 1])
    if name == ''
        if &buftype == 'quickfix'
            let name = '[Quickfix List]'
        else
            let name = '[No Name]'
        endif
    else
        let name = fnamemodify(name, ':t')
    endif
    let label .= name
    let wincount = tabpagewinnr(a:n, '$')
    return label . '[' . wincount . ']'
endfunction

function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        let s .= ' %<%{MyTabLabel(' . (i + 1) . ')} '
    endfor
    let s .= '%#TabLineFill#%T'
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999XX'
    endif
    return s
endfunction
