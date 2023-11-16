-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'dasupradyumna/midnight.nvim'
}

use 'yassinebridi/vim-purpura'

use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}

use 'nvim-treesitter/playground'
use 'ThePrimeagen/harpoon'
use 'mbbill/undotree'
use 'tpope/vim-fugitive'
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
        --- Uncomment these if you want to manage LSP servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    }
}
use 'voldikss/vim-floaterm'

use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}
    use 'lervag/vimtex'
    use 'mfussenegger/nvim-dap'
    use 'nvim-tree/nvim-tree.lua'

    if packer_bootstrap then
	require('packer').sync()
    end
end)
