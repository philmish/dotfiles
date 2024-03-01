vim.api.nvim_create_user_command("ClearWs", function ()
    vim.cmd(":%s/\\s\\+$//e")
end, {})
