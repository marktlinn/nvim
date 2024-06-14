return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        -- go
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.golines,

        -- makefile
        null_ls.builtins.diagnostics.checkmake,

        -- python
        null_ls.builtins.diagnostics.mypy.with {
          -- set Python virtualenv to work with MyPy
          extra_args = function()
            local virtual = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX' or '/usr'
            return { '--python-executable', virtual .. '/bin/python3' }
          end,
        },
        null_ls.builtins.formatting.black,
      },

      -- other
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.completion.spell,
    }
  end,
}
