-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set(
  'n',
  '[d',
  vim.diagnostic.goto_prev,
  { desc = 'Go to previous [D]iagnostic message' }
)
vim.keymap.set(
  'n',
  ']d',
  vim.diagnostic.goto_next,
  { desc = 'Go to next [D]iagnostic message' }
)
vim.keymap.set(
  'n',
  '<leader>e',
  vim.diagnostic.open_float,
  { desc = 'Show diagnostic [E]rror messages' }
)
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Nvim-tree toggle mapping
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { desc = 'Toggle Nvim Tree' })

-- Bufferline maps

-- Move to previous/next
vim.keymap.set('n', '<leader>bv', ':BufferPrevious<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bb', ':BufferNext<CR>', { desc = 'Prev buffer' })

-- Goto buffer in position...
vim.keymap.set('n', '<leader>b1', ':BufferGoto 1<CR>', { desc = 'Goto buffer 1' })
vim.keymap.set('n', '<leader>b2', ':BufferGoto 2<CR>', { desc = 'Goto buffer 2' })
vim.keymap.set('n', '<leader>b3', ':BufferGoto 3<CR>', { desc = 'Goto buffer 3' })
vim.keymap.set('n', '<leader>b4', ':BufferGoto 4<CR>', { desc = 'Goto buffer 4' })
vim.keymap.set('n', '<leader>b5', ':BufferGoto 5<CR>', { desc = 'Goto buffer 5' })
vim.keymap.set('n', '<leader>b6', ':BufferGoto 6<CR>', { desc = 'Goto buffer 6' })
vim.keymap.set('n', '<leader>b7', ':BufferGoto 7<CR>', { desc = 'Goto buffer 7' })
vim.keymap.set('n', '<leader>b8', ':BufferGoto 8<CR>', { desc = 'Goto buffer 8' })
vim.keymap.set('n', '<leader>b9', ':BufferGoto 9<CR>', { desc = 'Goto buffer 9' })

-- close buffer
vim.keymap.set('n', '<leader>bd', ':BufferClose<CR>', { desc = 'Close current buffer' })
vim.keymap.set(
  'n',
  '<leader>ba',
  ':BufferCloseAllButCurrentOrPinned<CR>',
  { desc = 'Close all but current/pinned' }
)

-- Terminal
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { desc = 'Toggle Terminal' })

-- Generic niceties --

-- Quick Save
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<c-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Quick Quit
vim.keymap.set({ 'n' }, '<leader>qq', ':q!<CR>', { desc = 'Quit vim' })
-- vim: ts=2 sts=2 sw=2 et
