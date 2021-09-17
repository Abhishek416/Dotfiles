local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- DashBoard
  use 'glepnir/dashboard-nvim'

  use { 'neoclide/coc.nvim', branch= 'release' }
  -- Debugging
  use 'mfussenegger/nvim-dap'
  
  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Explorer
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', } }

  -- StatusLine and Bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

	  -- ColorSchemes
  use 'christianchiarulli/nvcode-color-schemes.vim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  
  -- General Plugins
  use 'windwp/nvim-autopairs'

-- VIM Commentary
  use 'tpope/vim-commentary'

-- Telescope 
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use 'airblade/vim-rooter'

-- Floatterm
  use 'voldikss/vim-floaterm'

end)
