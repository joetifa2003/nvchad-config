--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports-reviser", "goimports" },
    typescript = { "prettierd" },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
