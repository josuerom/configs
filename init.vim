"*----------- Configuración [init.vim] 11/Enero/2021 6:43a.m COL -----------*
"
							"██╗███╗░░██╗██╗████████╗░░░██╗░░░██╗██╗███╗░░░███╗
							"██║████╗░██║██║╚══██╔══╝░░░██║░░░██║██║████╗░████║
							"██║██╔██╗██║██║░░░██║░░░░░░╚██╗░██╔╝██║██╔████╔██║
							"██║██║╚████║██║░░░██║░░░░░░░╚████╔╝░██║██║╚██╔╝██║
							"██║██║░╚███║██║░░░██║░░░██╗░░╚██╔╝░░██║██║░╚═╝░██║ 
							"╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
									 " Configurado por >> Josué Romero Jarava               
									 " Twitter >> https://twitter.com/Josueromram

so ~/AppData/Local/nvim/.nvim/plugins.vim
so ~/AppData/Local/nvim/.nvim/plugin-config.vim
so ~/AppData/Local/nvim/.nvim/maps.vim

syntax on
set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set nowrap
set cursorline
set scrolloff=8
set tabstop=2
set splitright
set termguicolors

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " unless they contain at least one capital letter

" my colorscheme favorite
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_enable_italic = 1
highlight Normal ctermbg=NONE
