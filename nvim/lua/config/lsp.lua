vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client == nil then
      return
    end
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
  "clangd",
  "yamlls",
  "zls",
})

-- configure lua_ls to use vim runtime files to include vim specific defintions
-- for diagnostics and auto-complete
vim.lsp.config('lua-language-server', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
       if
         path ~= vim.fn.stdpath('config')
         and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
       then
         return
       end
     end

     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
       runtime = {
         -- Tell the language server which version of Lua you're using (most
         -- likely LuaJIT in the case of Neovim)
         version = 'LuaJIT',
         -- Tell the language server how to find Lua modules same way as Neovim
         -- (see `:h lua-module-load`)
         path = {
           'lua/?.lua',
           'lua/?/init.lua',
         },
       },
       -- Make the server aware of Neovim runtime files
       workspace = {
         checkThirdParty = false,
         library = {
           vim.env.VIMRUNTIME
           -- Depending on the usage, you might want to add additional paths
           -- here.
           -- '${3rd}/luv/library'
           -- '${3rd}/busted/library'
         }
       }
     })
   end,
   settings = {
     Lua = {}
   }
 })
