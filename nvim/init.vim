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

let g:pydocstring_formatter = "google"
let g:pydocstring_doq_path = "~/.local/bin/doq"

lua require("plugins")
lua require("lsp")
lua require("lsp.config")
lua require("lsp.lua-ls")
lua require("lsp.clangd")
lua require("lsp.python")
lua require("lsp.html")
lua require("settings")
lua require("keymappings")

lua require("p_nvimtree")
lua require("colorscheme")
lua require("p_treesitter")
lua require("p_barbar")
lua require("p_galaxyline")
lua require("p_telescope")
lua require("p_autopairs")


" TODO: Check it
autocmd BufEnter * lua require'completion'.on_attach()

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

" plantuml-previewer
" https://github.com/weirongxu/plantuml-previewer.vim
let g:plantuml_previewer#save_format='png'

" tagbar
" https://github.com/preservim/tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='~/.config/nvim/ctags' 


" FSwitch
nmap <silent> <Leader>] :FSSplitRight<cr>

" Tags
set tags=./tags;/

" Autopep8
let g:autopep8_max_line_length=100


" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
autocmd BufNewFile *.puml 0r ~/.config/nvim/templates/plantuml.puml 
