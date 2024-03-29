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

  -- Clojure 
  use 'Olical/conjure'

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
  
  -- Install nvim-cmp, and buffer source as a dependency
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("lvim.core.cmp").setup()
    end,
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
    },
    run = function()
      -- cmp's config requires cmp to be installed to run the first time
      if not lvim.builtin.cmp then
        require("cmp").config()
      end
    end,
  }

  -- snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  -- editorconfig
  use 'editorconfig/editorconfig-vim'

  -- Fuzzy Find
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
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
  use {
	  'nvim-telescope/telescope-dap.nvim',
	  requires = { 'nvim-telescope/telescope.nvim' },
	  config = function()
		  require('telescope').load_extension('dap');
	  end
  }

  use {"akinsho/toggleterm.nvim"}
  end)
