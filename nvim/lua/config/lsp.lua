vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    if client:supports_method("textDocument/definition") then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
    end

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)
    -- TODO: Add a keybind for sending references or implementations to qflist
    -- and open the qflist in telescope
  end,
})
vim.opt.completeopt = { "noselect", "menu", "menuone" }

vim.lsp.enable({
  "lua-language-server",
  "gopls",
  "pyright",
  "rust-analyzer",
  "ts_ls",
})
