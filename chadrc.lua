---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  lsp_semantic_tokens = false,

  nvdash = {
    load_on_startup = true,
  },
  statusline = {
    theme = "vscode_colored",
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
