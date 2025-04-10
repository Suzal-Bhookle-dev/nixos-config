local null_ls = require("null-ls")

local format = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		-- formatting
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
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
