return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
  root_markers = { '.git' },
  settings = {
    -- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
    redhat = { telemetry = { enabled = false } },
    -- formatting disabled by default in yaml-language-server; enable it
    yaml = {
      format = { enable = true },
      schemas = {
        ["https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json"] = "**/docker-compose*.y*ml",
        ["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "**/*.gitlab-ci.y*ml",
        ["https://www.schemastore.org/github-action.json"] = ".github/actions/*.{yml,yaml}",
        ["https://www.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}"
      }
    },
  },
  on_init = function(client)
    --- https://github.com/neovim/nvim-lspconfig/pull/4016
    --- Since formatting is disabled by default if you check `client:supports_method('textDocument/formatting')`
    --- during `LspAttach` it will return `false`. This hack sets the capability to `true` to facilitate
    --- autocmd's which check this capability
    client.server_capabilities.documentFormattingProvider = true
  end,
}
