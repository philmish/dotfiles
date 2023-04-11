local M = {
    start_notification = "Starting Go Tests",
    _cmd = "go test ./... -v -json",
    _cache = {
        passed = {},
        failed = {},
    }
}

M.passed_packages = function ()
   local res = {}
   for k, _ in pairs(M._cache.passed) do
       table.insert(res, k .. " [✓]")
   end
   return res
end

M.failed_packages = function ()
    local res = {}
    for k, _ in pairs(M._cache.failed) do
        table.insert(res, k .. " [X]")
    end
    return res
end

M.stdout = function (data)
    if not data then
        return
    end

    for _, line in ipairs(data) do
        pcall(function ()
            local decoded = vim.json.decode(line)
            if decoded.Action == "pass" then
                if not M._cache.passed[decoded.Package] then
                    M._cache.passed[decoded.Package] = {
                        fun = {},
                        passed = true,
                    }
                    end
                if decoded.Test then
                    table.insert(
                        M._cache.passed[decoded.Package].fun,
                        decoded.Test
                    )
                end
            end
        end)
    end
end

M.exit = function ()
    local passed = M.passed_packages()
    local failed = M.failed_packages()
    if #passed > 0 then
        vim.notify(passed, vim.log.levels.INFO, {
            title = "Test Driver Passed",
        })
    else
        vim.notify(failed, vim.log.levels.ERROR, {
            title = "Test Driver Failed",
        })
    end
end

M._run_test = function ()
    vim.notify = require("notify")
    vim.notify(M.start_notification, vim.log.levels.INFO, {
        title = "Test Driver",
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
