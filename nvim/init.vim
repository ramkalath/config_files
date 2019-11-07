" for gvim remove these
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" ------------------------------------------------------------------------
" editor settings
set hidden "unsaved buffer wont close when opening a new buffer/file
set autochdir "keep up with the directory path when changing files
set clipboard^=unnamed "This sets the clipboard as the default register. Useful for copy paste from tmux
set nocompatible "This tells vim not to act like it predecessor vi
syntax enable "enables syntax highlighting
set shortmess=A "prevent vim from giving a warning it the swp file is open 
set cursorline
set encoding=utf8
set ignorecase
set nobackup
set virtualedit=onemore "cursor goes one more position than the usual
set laststatus=0 " enable status line
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
set mouse=a "sane selection without line numbers
set tabstop=4
set shiftwidth=4
filetype plugin indent on "identify the kind of filetype automatically

" ------------------------------------------------------------------------
set rtp+=~/.config/nvim/autoload/plug.vim
call plug#begin()
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'tikhomirov/vim-glsl'
call plug#end()

" -----------------------------------------------------------------------------------------
" This sets the color scheme
set background=dark
colorscheme gruvbox
let g:gruvbox_italic='1'
let g:gruvbox_italicize_comments='1'
let g:gruvbox_contrast_dark='hard'
silent colorscheme gruvbox
highlight Normal ctermbg=None guibg=None

" -----------------------------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,] "(TODO: check what this does)
"set nowrap

" -----------------------------------------------------------------------------------------
" this disables auto insertion of comments on a new line. Do no put this before enabling the plugins
"autocmd FileType * setlocal formatoptions-=cro
"autocmd FileType * setlocal formatoptions+=t
autocmd FileType * setlocal formatoptions=
autocmd FileType cpp set nowrap

" -----------------------------------------------------------------------------------------
" scrolling up and down multiple lines atonce
nmap <c-j> +3
vmap <c-j> +3
nmap <c-k> -3
vmap <c-k> -3

" -----------------------------------------------------------------------------------------
" autocomplete 
let g:ycm_global_ycm_extra_conf = '$HOME/config_files/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
set backspace=indent,eol,start
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl', 're!GL'] }
"let g:ycm_semantic_triggers = { 'cpp': [ 're!.' ] } " gives autocomplete without the need to press C-Space
"autocompelte using omnisharp
"let g:OmniSharp_server_use_mono = 1

" -----------------------------------------------------------------------------------------
" keyboard shortcuts 
nmap <c-n> :tabnext<CR>
nmap <c-p> :tabprevious<CR>
cnoreabbrev Wq :wq
cnoreabbrev W :w
cnoreabbrev WQ :wq
cnoreabbrev Q :q
cnoreabbrev Ww :w
cnoreabbrev wW :w
cnoreabbrev WW :w
set guitablabel=%t  " show only the file name an not the path 
au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)
imap vv <Esc>v
nmap vv <Esc>v
imap <c-l> <Esc>la
ab fpath :echo expand('%:p')
cnoreabbrev e tabedit
nmap cap g~iwea
cnoremap cap g~iwea

" -----------------------------------------------------------------------------------------
" tabline stuff
function! MyTabLine()
        let s = ''
        for i in range(tabpagenr('$'))
                " select the highlighting
                if i + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif

                " set the tab page number (for mouse clicks)
                let s .= '%' . (i + 1) . 'T'

                " the label is made by MyTabLabel()
                let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
        endfor

        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'

        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLine#%999X X'
        endif
        "echomsg 's:' . s
        return s
endfunction

function! MyTabLabel(n)
        let buflist = tabpagebuflist(a:n)
        let winnr = tabpagewinnr(a:n)
        let numtabs = tabpagenr('$')
        " account for space padding between tabs, and the "close" button
        let maxlen = ( &columns - ( numtabs * 2 ) - 4 ) / numtabs
        let tablabel = bufname(buflist[winnr - 1])
        while strlen( tablabel ) < 4
                let tablabel = tablabel . " "
        endwhile
        let tablabel = fnamemodify( tablabel, ':t' )
        let tablabel = strpart( tablabel, 0,  maxlen )
        return tablabel
endfunction

set tabline=%!MyTabLine()
set showtabline=2
autocmd GUIEnter * hi! TabLineFill term=underline cterm=underline gui=underline
autocmd GUIEnter * hi! TabLineSel  term=bold,reverse,underline
" ----------------------------------------------------------------------------------------------------------------

" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

" terminal and make commands
tnoremap <Esc> <C-\><C-n>
imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:split term://make && make run<CR><Esc><C-w><C-r>G
nmap <c-x><c-x> :update<CR>\|<Esc>:split term://make && make run<CR><Esc><C-w><C-r>G
cnoreabbrev hshell :update<CR>\|<Esc>:sp term://bash<CR><Esc><C-w><C-r>
cnoreabbrev vshell :update<CR>\|<Esc>:vsp term://bash<CR><Esc><C-w><C-r>

" ------------------------------------------------------------------------------
" UltiSnips stuff 
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsSnippetDirectories = ['/$HOME/.config/nvim/UltiSnips', 'UltiSnips']

" -------------------------------------------------------------------------------
" remember where the cursor was in the previous session; not if the file is gitcommit
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
	\ execute("normal `\"") |
\ endif

" -------------------------------------------------------------------------------
" highlight a TODO occurrence in bright red
highlight TODO cterm=italic ctermfg=196 guifg=#ff0000
match TODO /TODO/
ab TODO TODO(ram):
ab _todo TODO(ram):

highlight DONE cterm=italic ctermfg=LightGreen guifg=#00ff00
match DONE /DONE/
" -------------------------------------------------------------------------------
" spell check
set spellfile=~/.config/nvim/spell/en.utf-8.add

" clang completion for glew
let g:clang_user_options = ' -DCLANG_COMPLETE_ONLY'

" aliases
command Tasklist tabedit /home/ram/Dropbox/tasklist/tasklist.txt
