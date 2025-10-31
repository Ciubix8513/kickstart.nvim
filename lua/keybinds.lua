local M = {}

function M.add_keybinds()
  local normal_mode = {
    -- Movement between windows
    ["<C-h>"] = ":wincmd h<CR>",
    ["<C-j>"] = ":wincmd j<CR>",
    ["<C-k>"] = ":wincmd k<CR>",
    ["<C-l>"] = ":wincmd l<CR>",
  }
  local visual_mode = {
    ["<"] = "<gv",
    [">"] = ">gv",
  }

  local opts = { noremap = true, silent = true }

  for key, cmd in pairs(normal_mode) do
    vim.keymap.set("n", key, cmd, opts)
  end

  for key, cmd in pairs(visual_mode) do
    vim.keymap.set("v", key, cmd, opts)
  end
end

return M
