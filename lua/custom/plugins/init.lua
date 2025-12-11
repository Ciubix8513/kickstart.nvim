-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'ciubix8513/vim-colorschemes' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require('plugins.lualine').setup,
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = require('plugins.nvim-tree').setup,
  },
  {
    'akinsho/bufferline.nvim',
    config = require('plugins.bufferline').setup,
  },
  'lambdalisue/suda.vim',
  'wakatime/vim-wakatime',
  'norcalli/nvim-colorizer.lua',
  {
    'danymat/neogen',
    config = true,
  },
  {
    'uga-rosa/translate.nvim',
    config = true,
  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
        open_mapping = '<C-\\>',
        direction = 'float',
        float_opts = {
          border = 'rounded',
        },
      }
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = require('plugins.comment').setup,
  },
  {
    'mrcjkb/rustaceanvim',
    lazy = false,
    config = function()
      -- require("rustaceanvim").setup {
      --   tools = {
      --     runnables = {
      --       use_telescope = true,
      --     },
      --     autosethints = true,
      --     inlay_hints = { show_parameter_hints = true },
      --   },
      --   -- server = {
      --   --   -- on_attach = function(client, bufnr)
      --   --   --   require("lvim.lsp").common_on_attach(client, bufnr)
      --   --   --   local rt = require "rust-tools"
      --   --   --   vim.keymap.set("n", "<leader>la", rt.code_action_group.code_action_group, { buffer = bufnr })
      --   --   -- end,
      --   --   -- on_init = require("lvim.lsp").common_on_init,
      --   --   settings = {
      --   --     ["rust-analyzer"] = {
      --   --       -- cargo = {
      --   --       --   target = "wasm32-unknown-unknown"
      --   --       -- },
      --   --       procMacro = {
      --   --         enable = true
      --   --       },
      --   --       lens = {
      --   --         enable = true,
      --   --       },
      --   --       checkonsave = {
      --   --         command = "clippy",
      --   --       },
      --   --     },
      --   --   },
      --   -- },
      -- }
      vim.g.rustaceanvim = {
        tools = {
          autosethints = true,
          inlay_hints = { show_parameter_hints = true },
        },
      }
    end,
  },
  {
    'chrisgrieser/nvim-lsp-endhints',
    event = 'LspAttach',
    opts = {
      icons = {
        -- type = "󰜁 ",
        type = '=> ',
        parameter = '󰏪 ',
        offspec = ' ', -- hint kind not defined in official LSP spec
        unknown = ' ', -- hint kind is nil
      },
      label = {
        truncateAtChars = 10000,
      },
    },
  },

  {
    'andymass/vim-matchup',
    ---@type matchup.Config
    opts = {
      treesitter = {
        stopline = 500,
        enabled = false,
        -- disabled = true,
      },
      matchparen = {
        enabled = 1,
        -- deferred_show_delay
        hi_background = 1,
        -- hi_surround_always = 1,
        -- offscreen = { method = 'popup', border = 'meow', fullwidth = 1, scrolloff = 1 },
      },
    },
  },
}
