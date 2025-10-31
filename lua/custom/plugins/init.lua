-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { "ciubix8513/vim-colorschemes", branch = "new-cfg" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require "plugins.lualine".setup,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = require "plugins.nvim-tree".setup,
  },
  {
    "akinsho/bufferline.nvim",
    config = require "plugins.bufferline".setup,
  },
  "lambdalisue/suda.vim",
  "wakatime/vim-wakatime",
  "norcalli/nvim-colorizer.lua",
  {
    "danymat/neogen",
    config = true,
  },
  {
    "uga-rosa/translate.nvim",
    config = true,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = "<C-\\>",
        direction = "float",
        float_opts = {
          border = "rounded",
        }
      })
    end

  },
}
