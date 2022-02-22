local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'windwp/nvim-autopairs' -- autopairs
  use 'lukas-reineke/indent-blankline.nvim' -- indendation
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- Colorscheme
  use "lunarvim/darkplus.nvim"

  -- Completions
  use 'hrsh7th/nvim-cmp' -- completion plugins
  use 'hrsh7th/cmp-buffer' -- buffer completion
  use 'hrsh7th/cmp-path' -- path completion
  --use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  use "L3MON4D3/LuaSnip" -- snippet completion

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Nvim-tree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', } }
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }

  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use 'Pocco81/AutoSave.nvim'

  --  use 'OmniSharp/omnisharp-vim'
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  --  use { "wuelnerdotexe/vim-enfocado" }
  --use { 'ms-jpq/coq.artifacts', branch = 'artifacts'}
  -- use 'hrsh7th/cmp-cmdline'
  --use "rafamadriz/friendly-snippets"
  --  use "nvim-lua/popup.nvim"
  --  use "nvim-lua/plenary.nvim"
  --use {'ms-jpq/coq_nvim', branch =  'coq'}
end)
