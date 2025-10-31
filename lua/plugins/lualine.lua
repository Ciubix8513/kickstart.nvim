local M = {}

local function theme()
  local colors = {
    bg = "#000c38",
    fg = "#9966b8",
    text = "#6688cc",
    green = "#22aa44",
    blue = "#2277ff",
    red = "#cb4444",
  }

  return {
    normal = {
      a = { bg = colors.bg, fg = colors.fg, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.text },
      c = { bg = colors.bg, fg = colors.text }
    },
    insert = {
      a = { bg = colors.bg, fg = colors.green, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.text },
      c = { bg = colors.bg, fg = colors.text }
    },
    visual = {
      a = { bg = colors.bg, fg = colors.blue, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.text },
      c = { bg = colors.bg, fg = colors.text }
    },
    replace = {
      a = { bg = colors.bg, fg = colors.red, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.text },
      c = { bg = colors.bg, fg = colors.text }
    },
    command = {
      a = { bg = colors.bg, fg = colors.fg, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.text },
      c = { bg = colors.bg, fg = colors.text }
    },
    inactive = {
      a = { bg = colors.bg, fg = colors.fg, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.text },
      c = { bg = colors.bg, fg = colors.text }
    }
  }
end

function M.setup()
  local colors = {
    bg = "#202328",
    fg = "#bbc2cf",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    purple = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
  }

  local conf = {
    style = "none",
    options = {
      theme = theme,
      icons_enabled = true,
      section_separators = "",
      component_separators = "",
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          function()
            return "󰀘"
          end,
          color = {}
        }
      },
      lualine_b = {
        {
          "branch",
          color = { gui = "bold" },
        }
      },
      lualine_c = {
        {
          "diff",
          source =
              function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
          symbols = {
            added = "",
            modified = "",
            removed = "",
          },
          padding = { left = 2, right = 1 },
          diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.yellow },
            removed = { fg = colors.red },
          },
          cond = nil,
        }
      },
      lualine_x = {
        "diagnostics",
        {
          function()
            local buf_clients = vim.lsp.get_clients { bufnr = 0 }
            if #buf_clients == 0 then
              return "LSP Inactive"
            end

            local buf_client_names = {}

            for _, client in pairs(buf_clients) do
              if client.name ~= "null-ls" and client.name ~= "copilot" then
                table.insert(buf_client_names, client.name)
              end
            end

            local unique_client_names = table.concat(buf_client_names, ", ")
            local language_servers = string.format("[%s]", unique_client_names)

            return language_servers
          end
        },
        "filetype",
      },
      lualine_y = {
        "location"
      },
      lualine_z = {
        {
          "progress",
          fmt = function()
            return "%P/%L"
          end,
          color = {},
        }
      }
    }
  }

  require "lualine".setup(conf)
end

return M
