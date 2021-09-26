-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
	vim.fn.system('git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'marko-cerovac/material.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
	  'kabouzeid/nvim-lspinstall',
	  config = function()
		  local function setup_servers()
			  require'lspinstall'.setup()
			  local servers = require'lspinstall'.installed_servers()
  
			  for _, server in pairs(servers) do
				  require'lspconfig'[server].setup(require'lang'[server])
			  end
		  end

		  setup_servers()

		  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
		  require'lspinstall'.post_install_hook = function ()
			  setup_servers() -- reload installed servers
			  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
		  end
	  end
  }
  
  use 'omnisharp/omnisharp-vim'
  use 'nvim-lua/completion-nvim'

  -- editorconfig
  use 'editorconfig/editorconfig-vim'

  -- Fuzzy Find
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = {'nvim-lua/plenary.nvim'}
  }

  -- Syntax highlighting
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate',
	  config = function()
		  require'nvim-treesitter.configs'.setup {
			  ensure_installed = { 'c_sharp', 'javascript', 'lua', 'clojure', 'typescript' }, -- install additional with TSInstall
			  highlight = {
				  enable = true
			  }
		  };
	  end
  }

  -- File Tree
  use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Status Line
  use {
	  'glepnir/galaxyline.nvim',
	  branch = 'main',
	  config = function() require'eviline' end,
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- debugger
  use 'mfussenegger/nvim-dap'
  use {
	  'Pocco81/DAPInstall.nvim',
	  config = function()
		  local dap_install = require("dap-install")
		  local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

		  for _, debugger in ipairs(dbg_list) do
			  dap_install.config(debugger)
		  end
	  end
  }
  end)
