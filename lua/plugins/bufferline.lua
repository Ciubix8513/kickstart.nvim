local M = {}

function M.setup()
  local conf = {
    options = {
      mode = "buffers",
      numbers = "none",
      diagnostics = "nvim_lsp",
      show_close_icons = false,
      show_buffer_close_icons = false,
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "NvimTree",
          -- Leaving this without any text FOR NOW
          separator = true,
        }
      }
    },
  }

  require("bufferline").setup(conf)

  vim.keymap.set("n", "<Leader>bb",":BufferLineCyclePrev<CR>")
  vim.keymap.set("n", "<Leader>bn",":BufferLineCycleNext<CR>")
  vim.keymap.set("n", "<Leader>bh",":BufferLineCloseLeft<CR>")
  vim.keymap.set("n", "<Leader>bl",":BufferLineCloseRight<CR>")
  vim.keymap.set("n", "<Leader>bj",":BufferLinePick<CR>")
end

return M
