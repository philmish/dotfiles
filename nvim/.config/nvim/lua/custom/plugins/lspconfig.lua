return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",
    { "folke/neodev.nvim", opts = {} },

    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    require("neodev").setup({})
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("phil-custom-lsp-attach", { clear = true }),
      callback = function(event)
        local kmap = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local builtin = require("telescope.builtin")

        kmap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
        kmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
        kmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementations")
        kmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinitons")
        kmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
        kmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        kmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        kmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        kmap("K", vim.lsp.buf.hover, "Hover Documentation")
        kmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force", capabilities, require("cmp_nvim_lsp").default_capabilities()
    )

    local servers = {
      bashls = {},
      gopls = {},
      pyright = {},
      rust_analyzer = {},
      html = {},
      templ = {},
      cssls = {},
      tailwindcss = {},
      tsserver = {},
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      },
      sqlls = {},
      marksman = {},
      nil_ls = {},
      ocamllsp = {},
    }

    local manualy_installed_servers = {"ocamllsp", "templ"}

    require("mason").setup()

    local ensure_installed_servers = vim.tbl_keys(servers or {})
    local ensure_installed_tools = {"stylua", "ruff"}

    local ensure_installed = vim.tbl_filter(function (name)
      return not vim.tbl_contains(manualy_installed_servers, name)
    end, ensure_installed_servers)

    vim.list_extend(ensure_installed, ensure_installed_tools)
    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
      debounce_hours = 12,
    })

    for server, config in pairs(servers) do
      require("lspconfig")[server].setup({
        capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {}),
        filetypes = config.filetypes,
        handlers = vim.tbl_deep_extend("force", {}, config.handlers or {}),
        settings = config.settings,
      })
    end

    require("mason-lspconfig").setup {}
  end,
}

