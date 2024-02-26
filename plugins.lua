local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    lazy = false,
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  --
  --
  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
    event = { "VeryLazy" },
    config = function()
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()

      local meetingNotesTarget = "~/orgfiles/meeting-notes/Week %<%V>.org"

      -- Setup orgmode
      require("orgmode").setup {
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        org_startup_folded = "showeverything",
        org_capture_templates = {
          t = {
            description = "Task",
            template = "* TODO %?\n  %u",
          },
          m = "Meeting",
          mt = {
            description = "task",
            template = "\n* TODO %^{header} :task:\n  CREATED: %T\n\t%a\n\n\t%?\n",
            target = meetingNotesTarget,
          },
          mp = {
            description = "progress",
            template = "\n* TODO %^{header} :progress:\n  CREATED: %T\n\t%a\n\n\t%?\n",
            target = meetingNotesTarget,
          },
        },
      }
    end,
  },
  {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup {}
    end,
    lazy = false,
  },
  {
    lazy = false,
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      org = {
        headline_highlights = { "Headline" },
      },
    },
  },

  { "andweeb/presence.nvim", lazy = false },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "Exafunction/codeium.vim",
    lazy = false,
    enabled = true,
    config = function()
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<C-j>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<C-k>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,

    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "leoluz/nvim-dap-go",
    lazy = false,
    config = function()
      require("dap-go").setup {
        delve = {
          build_flags = "-tags=integration",
        },
      }
    end,
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function()
      require("nvim-dap-virtual-text").setup {
        virt_text_pos = "eol",
      }
    end,
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    config = function()
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    config = function()
      require("dressing").setup {
        input = {
          enabled = false,
        },
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { "mrjones2014/smart-splits.nvim", lazy = false },
}

return plugins