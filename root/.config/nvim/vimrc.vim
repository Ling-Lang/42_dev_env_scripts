call plug#begin('~/.config/nvim/plugged')

" Treesitter for syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" catppuccin theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" File tree for nvim
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()
set termguicolors
colorscheme catppuccin
