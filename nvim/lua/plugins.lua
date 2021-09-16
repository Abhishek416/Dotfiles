local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Information
  use 'nanotee/nvim-lua-guide'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  
  -- Autocomplete
  use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq.artifacts', branch= 'artifacts' }
  use { 'ms-jpq/coq.thirdparty', branch= '3p' }

  -- Debugging
  use 'mfussenegger/nvim-dap'

  -- Explorer
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', } }

  -- StatusLine and Bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

	-- Telescope
  -- use 'nvim-lua/popup.nvim'
  -- use 'nvim-lua/plenary.nvim'
  -- use 'nvim-telescope/telescope.nvim'
  -- use 'nvim-telescope/telescope-media-files.nvim'

  -- ColorSchemes
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'norcalli/nvim-colorizer.lua'


  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'

  -- General Plugins
  use 'windwp/nvim-autopairs'
  -- use 'kevinhwang91/nvim-bqf'
  use 'unblevable/quick-scope'

-- VIM Commentary
  use 'tpope/vim-commentary'
end)
