"        _                    
"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|
" 
" 	       [ ][O][ ]
"          [ ][ ][O]
"          [O][O][O]
"            antux
"

" #################################################
" # Righe di init per il funzionamento dei plugin #
" #################################################
set nocompatible
filetype plugin on
syntax enable
set number relativenumber mouse=a " Funzionamento del mouse
source $HOME/.vim/keys/mappings.vim " Comandi di vim personalizzati

" vim-plug
call plug#begin("~/.vim/plugged")

Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'joshdick/onedark.vim'

call plug#end()

"vim-addons-manager
fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  let c.log_to_buf = 1
  let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

ActivateAddons vim-snippets snipmate

" #############################
" # Configurazione dei plugin #
" #############################

"  ~> NERDTree <~
" Toglie lightline a NERDTree
augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu
" Chiude vim quando rimane solo la finestra e NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Font figo
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"  ~> coc.nvim <~
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \]

"  ~> lightline <~
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'onedark'}

"  ~> emmet <~
let g:user_emmet_leader_key='<C-E>'

" #######################
" # Impostazioni di vim #
" #######################

" Auto indentazione (1 tab = 2 spazi)
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Limite caratteri (80)
if exists('&colorcolumn')
    set colorcolumn=80
endif

" Tema
if (has("termguicolors")) " Controllo il supporto ai colori 24-bit
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

if &term =~ 'st-256color'
    set termguicolors&
    set t_ut=
endif

set ttymouse=sgr

colorscheme onedark   
