local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'neoclide/coc.nvim', branch= 'release' }

  -- Explorer
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', } }

  -- StatusLine and Bufferline
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }
  -- use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'nvim-lualine/lualine.nvim'

  -- colorschemes
  use 'navarasu/onedark.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use 'airblade/vim-rooter'

  -- general plugins
  use 'voldikss/vim-floaterm' -- floatterm
  use 'windwp/nvim-autopairs' -- autopairs
  use 'lukas-reineke/indent-blankline.nvim' -- indendation
  use 'tpope/vim-commentary'  -- comments
  use 'phaazon/hop.nvim'
end)
