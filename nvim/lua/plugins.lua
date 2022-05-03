local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
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

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  use 'windwp/nvim-autopairs' -- autopairs
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use 'lukas-reineke/indent-blankline.nvim' -- indendation
  use "akinsho/toggleterm.nvim"
  use "lewis6991/impatient.nvim"
  use 'Pocco81/AutoSave.nvim'

  -- Colorscheme
  use "lunarvim/darkplus.nvim"

  -- Completions
  use 'hrsh7th/nvim-cmp' -- completion plugins
  use 'hrsh7th/cmp-buffer' -- buffer completion
  use 'hrsh7th/cmp-path' -- path completion
  use 'hrsh7th/cmp-cmdline'
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  use "L3MON4D3/LuaSnip" -- snippet completion
  --use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

  -- Nvim-tree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line && TabLine
  --use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }
  use "moll/vim-bbye"
  use "akinsho/bufferline.nvim"
  use "nvim-lualine/lualine.nvim"

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Debugger ( Debug Adapter Protocol )
  --use 'mfussenegger/nvim-dap'
  --use "Pocco81/DAPInstall.nvim"
  --use { "rcarriga/nvim-dap-ui" }

  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
