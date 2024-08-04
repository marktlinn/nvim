return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local root_has_file = function(files)
      return function(utils)
        return utils.root_has_file(files)
      end
    end

    local prettier_root_files = { '.prettierrc', '.prettierrc.js', '.prettierrc.json' }

    local opts = {
      prettier_formatting = {
        condition = root_has_file(prettier_root_files),
      },
    }

    null_ls.setup {
      sources = {
        -- go
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.golines,

        -- js/ts
        null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
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
