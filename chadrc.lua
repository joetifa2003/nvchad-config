---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "aquarium",
  lsp_semantic_tokens = false,

  nvdash = {
    load_on_startup = true,
  },
  statusline = {
    theme = "vscode_colored",
  },

  hl_override = {
    ["@parameter"] = {
      fg = "white",
    },
    ["@punctuation.bracket"] = {
      fg = "#e8cca7",
    },
    ["Repeat"] = {
      fg = "purple",
    },
  },

  extended_integrations = { "dap" },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
