return {
  -- Менеджер LSP серверов
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    lazy = false,
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = false,
    config = true,
  },
  -- Конфигуратор LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = { "pyright", "ruff" } })

      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
      lspconfig.ruff.setup({})
    end,
  },
  -- Подсветка синтаксиса
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- Автодополнение
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },
}
