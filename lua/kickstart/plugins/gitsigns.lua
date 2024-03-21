-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      -- Navigation
      map({ 'n', 'v' }, 'gn', gs.next_hunk, { desc = 'Next git' })
      map({ 'n', 'v' }, 'gb', gs.prev_hunk, { desc = 'Previous git' })
      -- Actions
      map('n', '<leader>gS', ":Gitsigns stage_hunk<CR>", { desc = 'Stage hunk' })
      map('n', "<leader>gbR", gs.reset_buffer, { desc = 'Reset buffer' })
      map('n', '<leader>gU', gs.undo_stage_hunk, { desc = 'Unstage hunk' })
      map('n', '<leader>gh', gs.preview_hunk, { desc = 'Preview Hunk Hover' })
      map('n', '<leader>gl', gs.preview_hunk_inline, { desc = 'Preview Hunk Inline' })
      map('n', '<leader>gd', gs.diffthis, { desc = 'git [d]iff against index' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

