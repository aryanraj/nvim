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
  -- Package manager of nvim
  use 'wbthomason/packer.nvim'
  -- Color Scheme
  use 'ellisonleao/gruvbox.nvim'
  -- Nerd tree at the left <c-n>
  use 'nvim-tree/nvim-tree.lua'
  -- Web icons support
  use 'nvim-tree/nvim-web-devicons'
  -- Better command info at bottom
  use 'nvim-lualine/lualine.nvim'

  -- Syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  -- Syntax highlighting for rspec
  -- use 'keith/rspec.vim'

  -- Auto-completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  -- Auto-completion lua snippets
  use "L3MON4D3/LuaSnip"
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'mbbill/undotree'

  -- Git extensions
  use 'tpope/vim-fugitive'
  -- For :GBrowse support
  use 'tpope/vim-rhubarb'
  -- For :OpenBrowser command when netrw is disabled
  -- As fugitive searches for these commands before falling back to netrw
  -- https://github.com/tpope/vim-fugitive/blob/dac8e5c2d85926df92672bf2afb4fc48656d96c7/autoload/fugitive.vim#L7382-L7386
  use 'tyru/open-browser.vim'
  use 'lewis6991/gitsigns.nvim'

  -- Github Copilot
  -- use 'github/copilot.vim'
  use 'TabbyML/vim-tabby'

  -- COC
  -- TODO: check how to use node >= 14 only with this plugin
  -- use {'neoclide/coc.nvim', branch = 'release'}

  -- Code Folding
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- Automatic window width size change manager
  use { 'nvim-focus/focus.nvim', branch = 'master' }

  -- Filesystem in Neovim buffer
  use {
    'stevearc/oil.nvim',
    requires = {
      { 'nvim-tree/nvim-web-devicons' },
    }
  }

  -- LSP rename with VSCode like view
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP Configurations
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- Telescope and plugins
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
    }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  -- Trouble for pretty showing disgnostics
  use {
    'folke/trouble.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  -- Zenmode
  use {
    'folke/zen-mode.nvim',
    requires = { 'folke/twilight.nvim' },
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    -- Because out of the box, tsx/jsx is not supported
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  }
  -- MarkdownPreview
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }

  -- nvim-dap
  use {
    'mfussenegger/nvim-dap',
    requires = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      -- 'leoluz/nvim-dap-go',
    },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
