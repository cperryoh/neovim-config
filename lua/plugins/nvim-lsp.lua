return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls", "pyright", "ts_ls", "bashls",
        "jsonls", "html", "cssls", "hyprls"
      },
      automatic_enable = true,
      handlers = {
        function(server_name)
          -- The native LSP API (vim.lsp.config) is handling setup
          -- mason just needs to install the servers
        end,
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          inlay_hints = {
            auto = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          default_settings = {
            ["rust-analyzer"] = {
              inlayHints = {
                typeHints = { enable = true },
                parameterHints = { enable = true },
                chainingHints = { enable = true },
              },
            },
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "folke/which-key.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.opt.signcolumn = "yes"
      vim.opt.updatetime = 300

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded" },
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      -- Global config: capabilities for all servers
      vim.lsp.config("*", { capabilities = capabilities })

      -- Server-specific settings
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              typeHints = { enable = true },
              parameterHints = { enable = true },
              chainingHints = { enable = true },
            },
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client and client.name == "rust_analyzer" then
            vim.defer_fn(function()
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end, 500)
          elseif client and client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
          end

          -- Diagnostics
          map("n", "[g", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("n", "]g", vim.diagnostic.goto_next, "Next diagnostic")
          map("n", "<space>a", vim.diagnostic.setloclist, "Diagnostics list")

          -- GoTo
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
          map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
          map("n", "gr", vim.lsp.buf.references, "Go to references")

          -- Docs
          map("n", "K", vim.lsp.buf.hover, "Hover docs")
          map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

          -- Rename / actions
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
          map({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>qf", function()
            vim.lsp.buf.code_action({
              apply = true,
              context = { only = { "quickfix" }, diagnostics = vim.diagnostic.get(0) },
            })
          end, "Quick fix")

          -- Formatting / imports
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "Format buffer")

          map("n", "<leader>as", function()
            vim.lsp.buf.code_action({ apply = true, context = { only = { "source" } } })
          end, "Source actions")

          map("n", "<leader>oi", function()
            vim.lsp.buf.code_action({ apply = true, context = { only = { "source.organizeImports" } } })
          end, "Organize imports")

          -- Workspace
          map("n", "<space>s", vim.lsp.buf.workspace_symbol, "Workspace symbols")
          map("n", "<space>o", vim.lsp.buf.document_symbol, "Document symbols")
        end,
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          -- don't open if there's already a float open
          if vim.fn.pumvisible() == 0 then
            vim.diagnostic.open_float(nil, { focus = false })
          end
        end,
      })
    end,

  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
