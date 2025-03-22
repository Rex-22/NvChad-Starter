local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
  null_ls.builtins.diagnostics.checkmake,
  null_ls.builtins.formatting.gofumpt,
  null_ls.builtins.formatting.goimports_reviser,
  null_ls.builtins.formatting.golines,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.prettier.with { filetypes = { "html", "json", "yaml", "markdown" } },
  null_ls.builtins.formatting.shfmt.with { args = { "-i", "4" } },
  require("none-ls.formatting.ruff").with { extra_args = { "--extend-select", "I" } },
  require "none-ls.formatting.ruff_format",
}

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = false }
        end,
      })
    end
  end,
}
