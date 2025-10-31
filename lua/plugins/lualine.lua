local M = {}

function M.setup()
  local conf = {
    style = "lvim",
    options = {
      theme = "auto",
      icons_enabled = true,
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_a = {
        function()
          return "󰀘"
        end
      },
      lualine_b = { "branch" },
      lualine_x = {
        {
          "diagnostics",
        },
      }
    }
  }

  require "lualine".setup(conf)
end

return M
