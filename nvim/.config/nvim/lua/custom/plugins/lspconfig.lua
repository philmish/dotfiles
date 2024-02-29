return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
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
      gopls = {},
      pyright = {},
      rust_analyzer = {},
      tsserver = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
          },
        },
      },
    }

    require("mason").setup()

    local ensure_installed = vim.tbl_keys(servers or {})

    vim.list_extend(ensure_installed, {
      "stylua",
    })
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    require("mason-lspconfig").setup {
      handlers = {
        function(server_name)
          local server = servers[server_name]  or {}
          require("lspconfig")[server_name].setup {
            cmd = server.cmd,
            settings = server.settings,
            filetypes = server.filetypes,
            capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
          }
        end,
      },
    }
  end,
}

