return {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    go = { "goimports-reviser" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
