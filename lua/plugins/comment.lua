local M = {}

function M.setup()
  require("Comment").setup({
    toggler = {
      line = "<Leader>/",
    },
    opleader = {
      line = "<Leader>/",
    },
  })
end

return M
