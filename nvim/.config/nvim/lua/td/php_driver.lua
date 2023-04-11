local M = {
    start_notification = "Starting PHP Unit test",
    _cache = {
        output = {}
    },
    _cmd = "./vendor/bin/phpunit",
}

M.stdout = function (data)
    if not data then
        return
    end

    for _, line in ipairs(data) do
        if line ~= "" then
            table.insert(M._cache.output, line)
        end
    end
end

M.exit = function ()
    if #M._cache.output == 0 then
        vim.notify("No PHP test output", vim.log.levels.WARN, {
            title = "Test Driver PHP Unit",
            timeout = 1000,
        })
    else
        vim.notify(M._cache.output[#M._cache.output], vim.log.levels.INFO, {
            title = "Test Driver PHP Unit",
            timeout = 2000,
        })
    end
end

M._run_test = function ()
    vim.notify = require("notify")
    vim.notify(M.start_notification, vim.log.levels.INFO, {
        title = "Test Driver",
        timeout = 1000
    })
    vim.fn.jobstart(M._cmd, {
        stdout_buffered = true,
        on_stdout = function (_, data)
            M.stdout(data)
        end,
        on_exit = function ()
            M.exit()
        end
    })
end

return M
