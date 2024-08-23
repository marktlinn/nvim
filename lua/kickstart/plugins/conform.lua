return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        async = false,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        css = { 'prettier' },
        markdown = { ' prettier' },
        html = { 'prettier' },
        yaml = { 'prettier' },
        vue = { 'prettier' },

        go = { 'gofumpt', 'golines', 'goimports' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
