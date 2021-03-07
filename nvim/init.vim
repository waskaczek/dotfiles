""""""""""""""""""""""""""""""""""""""
"   File: Neovim config              "
"   __    __          _              "
"  / / /\ \ \__ _ ___| | ___   _     " 
"  \ \/  \/ / _` / __| |/ | | | |    "
"   \  /\  | (_| \__ |   <| |_| |    "
"    \/  \/ \__,_|___|_|\_\\__, |    "
"                          |___/     "
"   https://github.com/waskaczek     "
""""""""""""""""""""""""""""""""""""""

set encoding=utf8
set termguicolors 
set background=dark

" Hack to use NeoSolarized theme in tmux
" Also need add to tmux.conf followed command:
" set-option -ga terminal-overrides ",xterm-256color:Tc"
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
" End of hack.

let g:pydocstring_formatter = "google"
let g:pydocstring_doq_path = "~/.local/bin/doq"

lua require("plugins")
lua require("lsp_config")
lua require("settings")

colorscheme onedark

" TODO: Check it
"autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
""""""""""""""""""""""""""""""""""""""
" Configuration
""""""""""""""""""""""""""""""""""""""
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 2..'}, <bang>0)
" Buffers
nmap <leader>[ :bd<cr>
" https://github.com/voldikss/vim-skylight
let g:skylight_width = 0.5
let g:skylight_height = 0.5
let g:skylight_position = 'topright'
let g:skylight_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']
let g:skylight_jump_command = 'edit'


" vim-arline
" https://github.com/vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_theme='luna'
let g:airline_powerline_fonts = 1


" plantuml-previewer
" https://github.com/weirongxu/plantuml-previewer.vim
let g:plantuml_previewer#save_format='png'

" nerdtree
" https://github.com/preservim/nerdtree
map <C-n> :NERDTreeToggle<CR>

" tagbar
" https://github.com/preservim/tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='~/.config/nvim/ctags' 


" FSwitch
nmap <silent> <Leader>] :FSSplitRight<cr>

" Tags
set tags=./tags;/

" Cpp color syntax
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Autopep8
let g:autopep8_max_line_length=100


" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Copy
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

vnoremap <leader>y "*y
vnoremap <leader>p "*p
vnoremap <leader>Y "+y
vnoremap <leader>P "+p

" Buffers / Templates
autocmd BufNewFile *.puml 0r ~/.config/nvim/templates/plantuml.puml 
