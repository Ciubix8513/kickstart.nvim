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

  vim.keymap.set("n", "<Leader>bb", ":BufferLineCyclePrev<CR>", { desc = "Previous" })
  vim.keymap.set("n", "<Leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next" })
  vim.keymap.set("n", "<Leader>bh", ":BufferLineCloseLeft<CR>", { desc = "Close all to the left" })
  vim.keymap.set("n", "<Leader>bl", ":BufferLineCloseRight<CR>", { desc = "Close all to the right" })
  vim.keymap.set("n", "<Leader>bj", ":BufferLinePick<CR>", { desc = "Jump" })
end

return M
