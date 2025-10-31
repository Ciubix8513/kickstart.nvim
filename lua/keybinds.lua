local M = {}

function M.add_keybinds()
  local normal_mode = {
    -- Movement between windows
    ["<C-h>"] = ":wincmd h<CR>",
    ["<C-j>"] = ":wincmd j<CR>",
    ["<C-k>"] = ":wincmd k<CR>",
    ["<C-l>"] = ":wincmd l<CR>",
    ["р"] = "h",
    ["о"] = "j",
    ["л"] = "k",
    ["д"] = "l",
    ["ф"] = "a",
    ["Ф"] = "A",
    ["а"] = "f",
    ["А"] = "F",
    ["ш"] = "i",
    ["Ш"] = "I",
    ["к"] = "r",
    ["н"] = "y",
    ["з"] = "p",
    ["в"] = "d",
    ["вв"] = "dd",
    ["и"] = "b",
    ["ц"] = "w",
    ["г"] = "u",
    ["Ё"] = "~",
    ["<C-к>"] = "<C-r>",
    ["м"] = "v",
    ["М"] = "V",
    ["ч"] = "x",
    ["Ч"] = "X",
  }
  local visual_mode = {
    ["<"] = "<gv",
    [">"] = ">gv",
    ["р"] = "h",
    ["о"] = "j",
    ["л"] = "k",
    ["д"] = "l",
    ["ф"] = "a",
    ["Ф"] = "A",
    ["а"] = "f",
    ["А"] = "F",
    ["ш"] = "i",
    ["Ш"] = "I",
    ["к"] = "r",
    ["н"] = "y",
    ["з"] = "p",
    ["в"] = "d",
    ["и"] = "b",
    ["ц"] = "w",
    ["г"] = "u",
    ["Ё"] = "~",
    ["ч"] = "x",
    ["Ч"] = "X",
    ["вв"] = "dd"
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
