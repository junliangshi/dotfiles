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
" Plugin 'perforce'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/mileszs/ack.vim'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/tacahiroy/ctrlp-funky'
Plugin 'https://github.com/ivalkeen/vim-ctrlp-tjump'
Plugin 'https://github.com/FelikZ/ctrlp-py-matcher'
" Plugin 'https://github.com/JazzCore/ctrlp-cmatcher'
Plugin 'https://github.com/tpope/vim-sensible'
Plugin 'https://github.com/Shougo/unite.vim'
Plugin 'https://github.com/hewes/unite-gtags'
Plugin 'https://github.com/Shougo/unite-outline'
Plugin 'https://github.com/Shougo/vimproc.vim'
Plugin 'https://github.com/Lokaltog/vim-easymotion'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'https://github.com/Raimondi/delimitMate'
Plugin 'https://github.com/t9md/vim-quickhl'
Plugin 'https://github.com/rking/ag.vim'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'https://github.com/mhinz/vim-signify'
Plugin 'https://github.com/junegunn/vim-easy-align'
Plugin 'https://github.com/tomtom/tcomment_vim'
Plugin 'https://github.com/osyo-manga/vim-over'
Plugin 'https://github.com/terryma/vim-multiple-cursors'
Plugin 'https://github.com/mattesgroeger/vim-bookmarks'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'https://github.com/wellle/targets.vim'
Plugin 'https://github.com/tpope/vim-dispatch'
Plugin 'https://github.com/ntpeters/vim-better-whitespace'
Plugin 'https://github.com/vim-scripts/YankRing.vim'
Plugin 'https://github.com/tpope/vim-unimpaired'
Plugin 'https://github.com/SirVer/ultisnips'
Plugin 'https://github.com/honza/vim-snippets'
Plugin 'https://github.com/Yggdroot/indentLine'
Plugin 'https://github.com/mattdbridges/bufkill.vim'
Plugin 'https://github.com/myusuf3/numbers.vim'
Plugin 'https://github.com/idbrii/AsyncCommand'

" Color schemes
Plugin 'https://github.com/w0ng/vim-hybrid'
Plugin 'https://github.com/chriskempson/vim-tomorrow-theme'
Plugin 'https://github.com/nanotech/jellybeans.vim'
Plugin 'https://github.com/tomasr/molokai'
Plugin 'https://github.com/croaker/mustang-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

runtime! plugin/SENSIBle.vim
" override the sensible

let mapleader=","

colorscheme molokai
let g:rehash256 = 1
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme hybrid
"colorscheme jellybeans
"colorscheme mustang

set number
"set relativenumber
set mouse=a
set cursorline
set t_Co=256
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
set cindent
set smartindent
set incsearch
set hlsearch
set showmatch
set ruler
set ignorecase
set smartcase
set hidden
set confirm
set guioptions -=m
set guioptions -=T
set completeopt-=preview
set expandtab
set cul
set nobackup
set noswapfile

set encoding=utf-8
set fileencoding=utf-8
set listchars=tab:▸\ ,eol:¬
set list

set wildignore+=*/.hg/*,*/.git/*
set wildignore+=*/obsolete/*,*/SFFGenerator/*,*/TestDirectory/*

function! CppLint()
    let file = expand('%')
    if file == ''
        return
    endif
    "set makeprg=python\ /home/jshi/code/GUI/Tools/cpplint/cpplint.py\ %
    let &makeprg='python /home/jshi/code/GUI/Tools/cpplint/cpplint.py %'
    " execute 'silent make | cwindow'
    execute 'silent make!|copen'
endfunction
" silent make the gui dispaly ugly, need Ctrl-L to redraw the screen
nnoremap <Leader>cl :call CppLint()<CR><C-l>

function! CompileCPP()
    let file = expand('%')
    if file == ''
        return
    endif
    let &makeprg='/home/jshi/code/compile.sh %'
    " execute 'silent make | cwindow'
    execute 'silent make!|copen'
endfunction
" silent make the gui dispaly ugly, need Ctrl-L to redraw the screen
nnoremap <Leader>cm :call CompileCPP()<CR><C-l>
nnoremap <C-j> j<C-e>
nnoremap <C-k> k<C-y>

noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
inoremap <Up>     <NOP>
inoremap <Down>   <NOP>
inoremap <Left>   <NOP>
inoremap <Right>  <NOP>
noremap  <Up>     <NOP>
noremap  <Down>   <NOP>
noremap  <Left>   <NOP>
noremap  <Right>  <NOP>

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Source\ Code\ Pro\ 10
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
    " set guifont=Sauce\ Code\ Powerline\ 10
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" yank r -> relative path, f-> full path, n -> filename
nnoremap <Leader>yr :let @+ = expand("%")<CR>
nnoremap <Leader>yf :let @+ = expand("%:p")<CR>
nnoremap <Leader>yn :let @+ = expand("%:t")<CR>

" quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <F9>     <Plug>(quickhl-manual-toggle)
xmap <F9>     <Plug>(quickhl-manual-toggle)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)

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
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>
nnoremap <Leader>p :CtrlP<CR>

" Unite
" set no max for unite
let g:unite_source_rec_max_cache_files = 0
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"-no-quit -keep-focus
" nnoremap <leader>c :<C-u>Unite -buffer-name=files  -no-quit -keep-focus -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>
" nnoremap <leader>gc :<C-u>Unite -no-split -buffer-name=gtags_context -start-insert gtags/context<cr>
" nnoremap <leader>gr :<C-u>Unite -no-split -buffer-name=gtags_ref gtags/ref<cr>
" nnoremap <leader>gd :<C-u>Unite -no-split -buffer-name=gtags_def gtags/def<cr>
" nnoremap <leader>gg :<C-u>Unite -no-split -buffer-name=gtags_grep -start-insert gtags/grep<cr>
" nnoremap <leader>ga :<C-u>Unite -no-split -buffer-name=gtags_completion -start-insert gtags/completion<cr>
" nnoremap <silent><leader>ll :<C-u>UniteResume<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"gtags_unite
let g:unite_source_gtags_project_config = {
  \ '/home/jshi/code/': { 'treelize': 0 },
  \ '_':                   { 'treelize': 1 }
  \ }
" specify your project path as key.
" " '_' in key means default configuration.

" Gtags
" auto update gtags
let g:Gtags_Auto_Update = 1
let g:Gtags_Auto_Map = 1
" nnoremap <F2> :copen<CR>
" nnoremap <F4> :cclose<CR>
" nnoremap <F5> :Gtags<SPACE>
" nnoremap <F6> :Gtags -f %<CR>
" nnoremap <F7> :GtagsCursor -r<CR>
" nnoremap <leader>n :cn<CR>
" nnoremap <leader>p :cp<CR>
" nnoremap <C-\> :GtagsCursor<CR>

" gtags-cscope
let g:GtagsCscope_Auto_Map = 1
let g:GtagsCscope_Auto_Load = 1
let g:GtagsCscope_Use_Old_Key_Map = 0
set cscopetag
" nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" a.vim
let g:alternateSearchPath = 'sfr:src,sfr:..'
let g:alternateNoDefaultAlternate = 1

" easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-s2)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" perforce plugin
:let g:p4ClientRoot = '/n/filer3b/home/dev/jshi/code'
:let g:p4CheckOutDefault = 1

" YCM
" let g:ycm_server_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 1000
let g:ycm_key_list_select_completion = ['<C-N>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-P>', '<Up>']
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>go :YcmCompleter GoToImprecise<CR>

" delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" easyalign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" vim-bookmarks
nmap <Leader>mm <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mn <Plug>BookmarkNext
nmap <Leader>mp <Plug>BookmarkPrev
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mx <Plug>BookmarkClearAll

" ultisnips
function! UltiSnipsCallUnite()
    Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
    return ''
endfunction
inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" airline
let g:airline_theme = 'powerlineish'
" let g:airline_powerline_fonts = 1
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
" let g:airline_symbols = {}
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.whitespace = 'Ξ'

" signify plugin
let g:signify_disable_by_default = 1
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
