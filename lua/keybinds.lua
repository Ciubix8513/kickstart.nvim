local M = {}

local lazygit_toggle = function()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new {
    cmd = 'lazygit',
    hidden = true,
    direction = 'float',
    float_opts = {
      border = 'none',
      width = 100000,
      height = 100000,
      zindex = 200,
    },
    on_open = function(_)
      vim.cmd 'startinsert!'
    end,
    on_close = function(_) end,
    count = 99,
  }
  lazygit:toggle()
end

function M.add_keybinds()
  local normal_mode = {
    -- Movement between windows
    ['<C-h>'] = ':wincmd h<CR>',
    ['<C-j>'] = ':wincmd j<CR>',
    ['<C-k>'] = ':wincmd k<CR>',
    ['<C-l>'] = ':wincmd l<CR>',
    ['<C-left>'] = ':vertical:res -2<CR>',
    ['<C-right>'] = ':vertical:res +2<CR>',
    ['<C-up>'] = ':res -2<CR>',
    ['<C-down>'] = ':res +2<CR>',
    -- ["р"] = "h",
    -- ["о"] = "j",
    -- ["л"] = "k",
    -- ["д"] = "l",
    -- ["ф"] = "a",
    -- ["Ф"] = "A",
    -- ["а"] = "f",
    -- ["А"] = "F",
    -- ["ш"] = "i",
    -- ["Ш"] = "I",
    -- ["к"] = "r",
    -- ["н"] = "y",
    -- ["з"] = "p",
    -- ["в"] = "d",
    -- ["вв"] = "dd",
    -- ["и"] = "b",
    -- ["ц"] = "w",
    -- ["г"] = "u",
    -- ["Ё"] = "~",
    -- ["<C-к>"] = "<C-r>",
    -- ["м"] = "v",
    -- ["М"] = "V",
    -- ["ч"] = "x",
    -- ["Ч"] = "X",
    ['<Leader>gg'] = { func = lazygit_toggle, desc = 'open lazygit' },
    ['<Leader>h'] = { func = ':noh<CR>', desc = 'Clear search' },
  }
  local visual_mode = {
    ['<'] = '<gv',
    ['>'] = '>gv',
    -- ["р"] = "h",
    -- ["о"] = "j",
    -- ["л"] = "k",
    -- ["д"] = "l",
    -- ["ф"] = "a",
    -- ["Ф"] = "A",
    -- ["а"] = "f",
    -- ["А"] = "F",
    -- ["ш"] = "i",
    -- ["Ш"] = "I",
    -- ["к"] = "r",
    -- ["н"] = "y",
    -- ["з"] = "p",
    -- ["в"] = "d",
    -- ["и"] = "b",
    -- ["ц"] = "w",
    -- ["г"] = "u",
    -- ["Ё"] = "~",
    -- ["ч"] = "x",
    -- ["Ч"] = "X",
    -- ["вв"] = "dd",
  }

  local opts = { noremap = true, silent = true }

  for key, cmd in pairs(normal_mode) do
    if type(cmd) == 'table' then
      local opts1 = { noremap = true, silent = true, desc = cmd.desc }
      vim.keymap.set('n', key, cmd.func, opts1)
    else
      vim.keymap.set('n', key, cmd, opts)
    end
  end

  for key, cmd in pairs(visual_mode) do
    vim.keymap.set('v', key, cmd, opts)
  end
end

return M
