set number
set ttyfast

filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent


set pumheight=5

call plug#begin("~/.vim/plugged")
 " Plugin Section
 "Plug 'dracula/vim'
 "Plug 'itchyny/lightline.vim'
 "Plug 'vim-airline/vim-airline'
 "Plug 'vim-airline/vim-airline-themes'
 "Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
 "Plug 'rudrab/vimf90'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'kyazdani42/nvim-web-devicons'
 "Plug 'romgrk/barbar.nvim'
 Plug 'chrisbra/csv.vim'
 Plug 'Yggdroot/indentLine'
 Plug 'tpope/vim-sensible'
 Plug 'chun-yang/auto-pairs'
 Plug 'rust-lang/rust.vim'
 "Plug 'rudrab/vimf90'
 "Plug 'JuliaEditorSupport/julia-vim'
 "Plug 'AtsushiSakai/julia.vim'
 Plug 'mcchrish/nnn.vim'
 Plug 'mesonbuild/meson'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'ryanoasis/vim-devicons'
 Plug 'Mofiqul/dracula.nvim'
 Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
 Plug 'akinsho/bufferline.nvim', { 'tag': 'v4.*' }
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim',
 Plug 'nvim-tree/nvim-tree.lua'
 Plug 'psf/black', { 'branch': 'stable' }
 Plug 'github/copilot.vim'
 Plug 'eigenfoo/stan-vim'
call plug#end()

"hi Normal guibg=None ctermbg=None

" Indentlines customisations
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:lightline = {'colorscheme': 'dracula',}

" CHADtree shortcuts
"nnoremap <space>v <cmd>CHADopen<cr>
"nnoremap <space>l <cmd>call setqflist([])<cr>
"let g:chadtree_settings = { 'view.width': 30 , 'theme.icon_colour_set': "github", 'theme.text_colour_set': "env"}

" NvimTree shortcuts
nnoremap <space>v <cmd>NvimTreeToggle<cr>
nnoremap <space>l <cmd>NvimTreeFocus<cr>

" NNN File manager
nnoremap <space>n <cmd>NnnPicker<cr>
nnoremap <space>x <cmd>NnnExplorer<cr>

let g:coc_start_at_startup = 0
augroup coc
  autocmd!
  autocmd VimEnter * :silent CocStart
augroup end

" COC options
source /home/alexh/.config/nvim/coc-config.vim

" To prevent conceal in LaTeX files
let g:tex_conceal = ''

" Barbar options
"source /home/alexh/.config/nvim/barbar-config.vim
"source /home/alexh/.config/nvim/tree.lua

" Bufferline Keybinds
nnoremap <silent><A-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><A-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><A-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><A-4> <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><A-5> <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><A-6> <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><A-7> <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><A-8> <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><A-9> <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent><A-$> <Cmd>BufferLineGoToBuffer -1<CR>

" Various options
set mouse+=a
set wrap linebreak

" Weird fix for Coc autocomplete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Filetype specific options

" LaTeX
augroup tex
  autocmd!
  autocmd FileType plaintex,tex setlocal spell
  autocmd FileType tex setlocal spell
"  autocmd FileType plaintex setlocal tw=80
"  autocmd FileType tex setlocal tw=80
augroup end

" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 0

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

autocmd BufWritePre <buffer> lua vim.lsp.buf.format()

" Fortran options
let fortran_dep_install=3
