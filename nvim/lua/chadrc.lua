local M = {}

M.base46 = {
  theme = "tokyodark",
  -- transparency = false,
}

M.ui = {
  cmp = {
    icons_left = true,
    lspkind_text = true,
    format_colors = {
      tailwind = true,
    },
  },

  statusline = {
    theme = "vscode_colored",
    -- separator_style = "arrow",
  },
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

M.lsp = {
  signature = true,
}

return M
