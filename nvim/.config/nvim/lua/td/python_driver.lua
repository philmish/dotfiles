local M = {
    _cache = {
        output = {},
        coverage = {},
    },
    _cmd = "python3 -m unittest",
    _with_coverage = "coverage run -m unittest && coverage json && cat coverage.json",
    start_notification = "Starting python tests ...",
}

M.set_cmd = function (cmd)
    M._cmd = cmd
end

M.stdout = function(data)
    if not data then
        return
    end
    local out = {}
    for _, line in ipairs(data) do
        if line ~= "" then
            table.insert(out, line)
        end
    end

    pcall(function ()
        M._cache.coverage = vim.json.decode(out[#out])
    end)
end

M.stderr = function (data)
    if not data then
        return
    end

    for _, line in ipairs(data) do
        if line ~= "" then
            table.insert(M._cache.output, line)
        end
    end
end

M.exit = function (coverage)
    if #M._cache.output == 0 then
        vim.notify("No python test output", vim.log.levels.WARN, {
            title = "Test Driver Python",
            timeout = 1000,
        })
    else
        vim.notify(M._cache.output[#M._cache.output], vim.log.levels.INFO, {
            title = "Test Driver Python",
            timeout = 2000,
            on_close = function ()
                if coverage then
                    vim.notify(
                    "Coverage: " .. M._cache.coverage.totals.percent_covered_display .. "%",
                    vim.log.levels.INFO, {
                        title = "Test Driver Coverage"
                    })
                end
            end
        })
    end
end

M._run_test = function ()
    vim.notify = require("notify")
    vim.notify(M.start_notification, vim.log.levels.INFO, {
        title = "Test Driver",
        timeout = 1000,
    })

    vim.fn.jobstart(M._cmd, {
        stdout_buffered = true,
        on_stderr = function (_, data)
            M.stderr(data)
        end,
        on_exit = function ()
            M.exit()
        end
    })
end

M._run_with_coverage = function ()
    vim.notify = require("notify")
    vim.notify(M.start_notification, vim.log.levels.INFO, {
        title = "Test Driver with Coverage",
        timeout = 1000,
    })

    vim.fn.jobstart(M._with_coverage, {
        stdout_buffered = true,
        on_stdout = function (_, data)
            M.stdout(data)
        end,
        on_stderr = function (_, data)
            M.stderr(data)
        end,
        on_exit = function ()
            M.exit(true)
        end
    })
end

return M
