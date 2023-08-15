local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "tpope/vim-surround",
    event = 'BufEnter', -- 在lazy.vim下这个必需加上
    config = function()
      vim.g.surround_115 = "**\r**" -- 115 is the ASCII code for 's'
      vim.g.surround_47 = "/* \r */" -- 47 is /
    end
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false
  },
  { -- 快速修改变量命名风格
    "chenasraf/text-transform.nvim",
    event = 'BufEnter', -- 在lazy.vim下这个必需加上
    version = "*",
    config = function()
      require("text-transform").setup({
        debug = false,
        keymap={
          -- Normal mode keymap.
          ["n"] = "<Leader>`",
          -- Visual mode keymap.
          ["v"] = "<Leader>`",
        }
      })
    end,
  },
  { -- Lsp 代码大纲
    "simrat39/symbols-outline.nvim",
    event = 'BufEnter', -- 在lazy.vim下这个必需加上
    version = "*",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufEnter",
    lazy = true,
    config = function()
      require("diffview").setup({
        file_panel = {
          win_config = {                      -- See ':h diffview-config-win_config'
            position = "bottom",
            height = 15,
          },
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  }
}

return plugins
