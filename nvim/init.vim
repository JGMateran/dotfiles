syntax on

set mouse=a

" Indent setup
set autoindent
set smartindent
set cindent
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

set nocompatible

set clipboard+=unnamedplus
set encoding=UTF-8
set number
set rnu
set nowrap

set nohlsearch
set ignorecase
set showmatch

set nobackup
set nowritebackup
set noswapfile

set completeopt=menu,menuone,noselect

let mapleader = " "

filetype indent on
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'sheerun/vim-polyglot'

Plug 'github/copilot.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'andrewradev/tagalong.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Yggdroot/indentLine'

Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'
" Plug 'editorconfig/editorconfig-vim'

" Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'

Plug 'numToStr/Comment.nvim'
" Plug 'karb94/neoscroll.nvim'
Plug 'max397574/better-escape.nvim'

" Plug 'yardnsm/vim-import-cost', { 'do': 'npm install --production' }
" Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-commentary'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'lewis6991/gitsigns.nvim'

" Plug 'ellisonleao/carbon-now.nvim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'joshdick/onedark.vim'
" Plug 'navarasu/onedark.nvim'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Plug 'akinsho/toggleterm.nvim'

" Experiment
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'
"
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/nvim-cmp'
"
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'
"
" Plug 'onsails/lspkind-nvim'

" Plug 'lukas-reineke/indent-blankline.nvim'

" New plugins
Plug 'lewis6991/gitsigns.nvim'

Plug 'pantharshit00/vim-prisma'

" Themes
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'olimorris/onedarkpro.nvim'

" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'karb94/neoscroll.nvim'

call plug#end()

lua << EOF

require('gitsigns').setup()
require('neoscroll').setup()

require('nvim-autopairs').setup({})
require('nvim-ts-autotag').setup({})

require('Comment').setup()
-- require('neoscroll').setup()
require('better_escape').setup()

EOF

" let g:material_theme_style = 'ocean-community'
" let g:material_terminal_italics = 1
" let g:airline_theme = 'material'

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
colorscheme tokyonight

" Vim Script
" let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
" colorscheme catppuccin

lua << EOF

-- local onedarkpro = require("onedarkpro")
-- onedarkpro.setup({
--   theme = "onedark_vivid"
-- })
-- onedarkpro.load()

EOF

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

imap <expr><tab> emmet#expandAbbrIntelligent("\<tab>")

" Telescope shorcuts
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
" nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_stash()<cr>

nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" nmap ss :split<cr>
" nmap sv :vsplit<cr>

" Select all
nmap <C-a> gg<S-v>G

nnoremap <leader>gg :Neogit<cr> 
nnoremap <leader>gc :Neogit commit<cr> 

" Converts the line to lowercase
nnoremap <leader>u <S-v>u

set background=dark
set t_Co=256

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
endif

inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

nmap <leader>j :bprevious<CR>
nmap <leader>k :bnext<CR>

nnoremap <leader><tab> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

nnoremap <leader>ee :vsplit $MYVIMRC<CR>

lua << EOF

local lualine = require('lualine')
local telescope = require('telescope')
local treesitter = require('nvim-treesitter.configs')
local nvimtree = require('nvim-tree')

lualine.setup({
  options = {
    theme = 'tokyonight'
  }
}) 

telescope.setup({ 
  extensions = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case"
  },
  defaults = { 
    file_ignore_patterns = {'node_modules'},
    preview = false
  } 
})

treesitter.setup({
  highlight = {
		enable = true
	},
  ensure_installed = {
    'tsx',
    'json',
    'html',
    'scss'
  }
})

nvimtree.setup()

local neogit = require('neogit')

neogit.setup({
  integrations = {
    -- use { 
    --   'TimUntersberger/neogit', 
    --   requires = { 
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim' 
    --   }
    -- }
    diffview = true
  }
})

EOF

nnoremap <leader>fh :DiffviewFileHistory<CR>
nnoremap <leader>fc :DiffviewClose<CR>

lua << EOF
-- vim.opt.termguicolors = true
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

-- require("indent_blankline").setup {
--     char = "",
--     char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     space_char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     show_trailing_blankline_indent = false,
-- }
-- EOF
