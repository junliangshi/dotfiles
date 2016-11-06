if v:version > 700

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'genutils'
Plugin 'a.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/tacahiroy/ctrlp-funky'
Plugin 'https://github.com/FelikZ/ctrlp-py-matcher'
Plugin 'https://github.com/tpope/vim-sensible'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'https://github.com/tpope/vim-unimpaired'
Plugin 'https://github.com/tpope/vim-dispatch'

if has("gui_running")
Plugin 'https://github.com/Shougo/unite.vim'
Plugin 'https://github.com/Shougo/unite-outline'
"Plugin 'https://github.com/Shougo/vimproc.vim'
Plugin 'https://github.com/hewes/unite-gtags'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/vim-airline/vim-airline-themes'
Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'https://github.com/t9md/vim-quickhl'
Plugin 'https://github.com/rking/ag.vim'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'https://github.com/junegunn/vim-easy-align'
"Plugin 'https://github.com/mhinz/vim-signify'
Plugin 'https://github.com/osyo-manga/vim-over'
Plugin 'https://github.com/mattesgroeger/vim-bookmarks'
Plugin 'https://github.com/wellle/targets.vim'
Plugin 'https://github.com/ntpeters/vim-better-whitespace'
Plugin 'https://github.com/SirVer/ultisnips'
Plugin 'https://github.com/honza/vim-snippets'
Plugin 'https://github.com/Yggdroot/indentLine'
" Plugin 'https://github.com/mattdbridges/bufkill.vim'
Plugin 'https://github.com/myusuf3/numbers.vim'
Plugin 'https://github.com/skywind3000/asyncrun.vim'


Plugin 'https://github.com/google/vim-maktaba'
Plugin 'https://github.com/google/vim-codefmt'
Plugin 'https://github.com/justinmk/vim-sneak'
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/chrisbra/vim-diff-enhanced'
Plugin 'https://github.com/gregsexton/gitv'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/tpope/vim-surround'

" Color schemes
Plugin 'https://github.com/w0ng/vim-hybrid'
Plugin 'https://github.com/chriskempson/vim-tomorrow-theme'
Plugin 'https://github.com/nanotech/jellybeans.vim'
Plugin 'https://github.com/tomasr/molokai'
Plugin 'https://github.com/croaker/mustang-vim'
Plugin 'https://github.com/jaromero/vim-monokai-refined'
endif

Plugin 'https://github.com/altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

runtime! plugin/SENSIBle.vim
" override the sensible

let mapleader=' '

" set background=light
" if has("gui_running")
" colorscheme molokai
" let g:rehash256 = 1
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme hybrid
"colorscheme jellybeans
" colorscheme mustang
" colorscheme solarized
syntax enable
set background=light
colorscheme solarized
" endif

if has("gui_running")
set mouse=a
endif

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

set number
set exrc
set secure
"set relativenumber
set t_Co=256
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
"set colorcolumn=100
set cindent
set smartindent
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
set hidden
set confirm
set guioptions=aci
set completeopt-=preview
set expandtab
set cul
set nobackup
set noswapfile
set shortmess=filnxtToOI
set noshowcmd
set visualbell t_vb=

set encoding=utf-8
set fileencoding=utf-8

set list
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

set whichwrap+=<,>,h,l,[,]
set lazyredraw " no redraws in macros
set scrolloff=4

set nofsync
set swapsync=""

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set wildignore+=*/.hg/*,*/.git/*

nnoremap <C-j> j<C-e>
nnoremap <C-k> k<C-y>
nnoremap j gj
nnoremap k gk

" reselect visual block after indent/outdent
" vnoremap < <gv
" vnoremap > >gv
" vnoremap = =gv
" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" C-S to save
nnoremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" disable Ex mode, and run q register
" always save temp micro to q register
nnoremap Q @q

" disable up/down/left/right
inoremap <Up>     <NOP>
inoremap <Down>   <NOP>
inoremap <Left>   <NOP>
inoremap <Right>  <NOP>
nnoremap <Up>     <NOP>
nnoremap <Down>   <NOP>
nnoremap <Left>   <NOP>
nnoremap <Right>  <NOP>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap Y y$

" Make a visual selection of the last text pasted.
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" select the last inserted text
nnoremap gV `[v`]

" Highlight merge conflict markers, use 2match here,
" match is alreay used by better_whitespace_plugin
highlight todo_highlight ctermbg=darkgrey guibg=#592929
2match todo_highlight '\v^(\<|\=|\>|\|){7}([^=].+)?$'
" Jump to next/previous merge conflict marker
nnoremap <silent> ]C /\v^(\<\|\=\|\>\|\\|){7}([^=].+)?$<CR>
nnoremap <silent> [C ?\v^(\<\|\=\|\>\|\\|){7}([^=].+)\?$<CR>

command! -nargs=1 GrepCurrentBuffer call GrepCurrentBuffer(<q-args>)
function! GrepCurrentBuffer(query)
    let file = expand('%')
    if file ==''
        return
    endif
    let cmd = 'silent vimgrep '
    let cmd .= a:query . ' ' . file
    execute cmd
endfunction

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Source\ Code\ Pro\ 10
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

if has("autocmd")
  " Always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside
  " an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" highlight characters that go beyond column 80
augroup overLength
  autocmd!
  autocmd bufenter,winenter *
        \ highlight overlength ctermbg=darkgrey ctermfg=white guibg=#595959 guifg=white
  "autocmd bufenter,winenter *
  "      \ highlight overlength ctermbg=darkgrey guibg=#592929
  " let pattern = '\%81v.\+'
  " autocmd bufenter,winenter *
        " \ let w:m1=matchadd('overlength', pattern, -1)
  " call matchadd, do not use match, vim-better-whitespace with this already
  " need to use 2match or matchadd here
  " just highlight the first character, show new line, so highlight 101 not
  " 100
  autocmd bufenter * call  matchadd('overlength', '\%101v')
  "autocmd bufenter * 2match overlength /\%>80v.\+/
augroup end

augroup qf
    autocmd!
    autocmd QuickFixCmdPost grep,make,grepadd,vimgrep,vimgrepadd,cscope,cfile,cgetfile,caddfile,helpgrep cwindow
    autocmd QuickFixCmdPost lgrep,lmake,lgrepadd,lvimgrep,lvimgrepadd,lfile,lgetfile,laddfile lwindow
augroup end

" yank r -> relative path, f-> full path, n -> filename
nnoremap <silent> <leader>yr :let @+ = expand("%")<CR>
nnoremap <silent> <leader>yf :let @+ = expand("%:p")<CR>
nnoremap <silent> <leader>yn :let @+ = expand("%:t")<CR>

" do not move the cursor and always set hls.
nnoremap <silent> * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
nnoremap <silent> g* :let @/ = expand('<cword>')\|set hlsearch<C-M>
" nnoremap <silent> <leader>ch :let @/ = ''<CR>
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" quickhl
nmap <leader>hl <Plug>(quickhl-manual-this)
xmap <leader>hl <Plug>(quickhl-manual-this)
nmap <F9>     <Plug>(quickhl-manual-toggle)
xmap <F9>     <Plug>(quickhl-manual-toggle)
nmap <leader>hr <Plug>(quickhl-manual-reset)
xmap <leader>hr <Plug>(quickhl-manual-reset)

" indentLine
let g:indentLine_faster = 1
" | ¦ ┆ │
let g:indentLine_char = '┆'

" Set no max file limit for ctrlp
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 350
" let g:ctrlp_max_height=25
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_extensions = ['funky']
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <leader>ta :CtrlPBufTagAll<CR>
nnoremap <leader>pc :CtrlPChange<CR>
nnoremap <leader>pm :CtrlPMRUFiles<CR>
nnoremap <leader>pq :CtrlPQuickfix<CR>

" Unite
" set no max for unite
let g:unite_source_rec_max_cache_files = 0
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
"nnoremap <silent> <leader>g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
"nnoremap <silent> <leader>cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> <leader>o  :<C-u>Unite outline -buffer-name=outline -start-insert<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <leader>gc :<C-u>Unite  -buffer-name=gtags_context -start-insert gtags/context<cr>
nnoremap <leader>gr :<C-u>Unite  -buffer-name=gtags_ref gtags/ref<cr>
nnoremap <leader>gd :<C-u>Unite  -buffer-name=gtags_def gtags/def<cr>
nnoremap <leader>gg :<C-u>Unite  -buffer-name=gtags_grep -start-insert gtags/grep<cr>
nnoremap <leader>ga :<C-u>Unite  -buffer-name=gtags_completion -start-insert gtags/completion<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


" Gtags
" let g:Gtags_Auto_Update = 1
let g:Gtags_Auto_Map = 1

" gtags-cscope
let g:GtagsCscope_Auto_Map = 1
let g:GtagsCscope_Auto_Load = 1
let g:GtagsCscope_Use_Old_Key_Map = 0
set cscopetag
set cscopequickfix=s-,g-,d-,c-,i-,t-,e-,f-

" a.vim
let g:alternateSearchPath = 'sfr:src,sfr:..'
let g:alternateNoDefaultAlternate = 1

" YCM
" let g:ycm_server_log_level = 'debug'
let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 1
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_max_diagnostics_to_display = 1000
let g:ycm_key_list_select_completion = ['<C-N>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-P>', '<Up>']
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>go :YcmCompleter GoToImprecise<CR>

" vim-bookmarks
nmap <leader>mm <Plug>BookmarkToggle
nmap <leader>mi <Plug>BookmarkAnnotate
nmap <leader>ma <Plug>BookmarkShowAll
nmap <leader>mn <Plug>BookmarkNext
nmap <leader>mp <Plug>BookmarkPrev
nmap <leader>mc <Plug>BookmarkClear
nmap <leader>mx <Plug>BookmarkClearAll

" ultisnips
function! UltiSnipsCallUnite()
    Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
    return ''
endfunction
inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>

let g:UltiSnipsExpandTrigger = '<Tab>'
"let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" auto pairs
let g:AutoPairsShortcutBackInsert = '<C-b>'
let g:AutoPairsShortcutJump = '<S-Tab>'

" airline
let g:airline_theme = 'solarized'

" vim better white space
let g:better_whitespace_filetypes_blacklist=['unite', 'mkd']

" numbers
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree', 'unite', 'startify', 'vimshell', 'w3m']

" nerdcommenter
let g:NERDSpaceDelims = 1

" sneak
let g:sneak#streak = 1
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

if !has("gui_running")
    set nocursorline
endif

else
set nocompatible
endif "if v:version > 700

