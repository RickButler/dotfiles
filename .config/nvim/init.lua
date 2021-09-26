require('plugins')

-- Automatically run PackerCompile if plugins.lua changes
vim.api.nvim_exec([[
   augroup packer_user_config
   autocmd!
   autocmd BufWritePost plugins.lua source <afile> | PackerCompile
   augroup END 
]],false)

vim.cmd('colorscheme material')
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.g.OmniSharp_server_use_mono = 1
vim.g.OmniSharp_server_path = '~/.local/share/nvim/lspinstall/csharp/omnisharp/run'
