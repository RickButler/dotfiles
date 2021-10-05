require('plugins')
require('mappings')

vim.cmd('colorscheme material')
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- global settings
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_matching_ignore_case = 1
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_hide_dotfiles = 1

-- options
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.mouse          = 'a'
vim.o.sidescroll     = 2 -- make scrolling better

-- nvim-tree options
vim.o.completeopt = 'menu,menuone,noselect,noinsert' -- better completion

-- scroll options
vim.wo.scrolloff = 2
vim.wo.sidescrolloff = 15
vim.wo.number = true

-- Automatically run PackerCompile if plugins.lua changes
vim.api.nvim_exec([[
   augroup packer_user_config
   autocmd!
   autocmd BufWritePost plugins.lua source <afile> | PackerCompile
   augroup END 
]],false)

-- Using FVIM in windows to Connect to NVIM Server
if vim.g.fvim_os then
   vim.cmd 'set guifont=Hack\\ Nerd\\ Font:h12'
   --vim.cmd('FVimUIPopupMenu v:true')
end



