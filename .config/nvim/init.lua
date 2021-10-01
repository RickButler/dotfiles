require('plugins')
vim.cmd('colorscheme material')
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.g.completion_enable_snippet = 'UltiSnips'
vim.o.completeopt = 'menuone,noselect,noinsert' -- better completion
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.mouse          = 'a'
local opts = { noremap=true, silent=true }

-- file tree mappings
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>NvimTreeFindFile<CR>', opts)



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
end



