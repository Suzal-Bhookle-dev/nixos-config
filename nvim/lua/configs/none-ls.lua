local null_ls = require("null-ls")
local format = null_ls.builtins.formatting

-- Define augroup for format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    -- Formatters
    format.stylua,
    format.black,
    format.biome,
    format.alejandra,
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(fmt_client)
              -- Only use none-ls for formatting
              return fmt_client.name == "null-ls"
            end,
          })
        end,
      })
    end
  end,
})

