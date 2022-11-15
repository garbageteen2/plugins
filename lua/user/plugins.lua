local fn = vim.fn


local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

-- Disables builtin neovim plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window (doesn't work well sometimes)
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

   -- Measure startup time with :StartupTime
   use 'dstein64/vim-startuptime'
  
   -- Automatically close a bracket when opened
   use 'jiangmiao/auto-pairs'
  
   -- Highlight words that are the same as the one you are hovering
   use({
     "RRethy/vim-illuminate",
     config = [[require('user.config.illuminate')]]
   })
  
   -- Faster than the built in filetype.vim
   -- use "nathom/filetype.nvim"
  
   -- Comment out blocks of text
   use({
     'b3nj5m1n/kommentary',
     config = [[require('user.config.kommentary')]]
   })
  
   -- File finder
   use {
     'nvim-telescope/telescope.nvim', tag = '0.1.0',
     config = [[require('user.config.telescope')]]
   }
  
   -- -- Folder tree
   use {
     'kyazdani42/nvim-tree.lua',
     requires = {
       'kyazdani42/nvim-web-devicons', -- optional, for file icons
     },
     config = [[require('user.config.nvimtree')]]
   }
  
   -- faster load times
   use {
     'lewis6991/impatient.nvim',
     config = function()
       require('impatient')
     end
   }

  -- LSP
 use {
   "williamboman/mason-lspconfig.nvim",
   requires = {
     "williamboman/mason.nvim",
     "neovim/nvim-lspconfig", -- enable LSP
   },
   config = [[require('user.config.lsp')]]
 }

   -- Flutter helpers + dartls
   use {
     'akinsho/flutter-tools.nvim',
     config = [[require('user.config.flutter-tools')]]
   }
  
   -- Auto completion
   use {
     "hrsh7th/nvim-cmp", -- enable LSP
     config = [[require('user.config.cmp')]]
   }
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
  
   -- Snippets
   use 'hrsh7th/cmp-vsnip'
   use 'hrsh7th/vim-vsnip'

   -- Tree sitter for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('user.config.treesitter')]],
    run = ":TSUpdate",
  }

  -- Vscode color scheme
  use {
    'Mofiqul/vscode.nvim',
    config = function()
      vim.cmd('colorscheme vscode')
    end
  }

  -- use({
  --     "glepnir/lspsaga.nvim",
  --     branch = "main",
  --     config = function()
  --         local saga = require("lspsaga")
  --         saga.init_lsp_saga({
  --             -- your configuration
  --         })
  --     end,
  -- })
  -- Install packer if system doesn't have it
  if packer_bootstrap then
    require('packer').sync()
  end
end)
