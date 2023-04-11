local M = {
    _cmd = "npm test 2>&1 | tail -1",
    _cache = {
        passed_suites = 0,
        passed_tests = 0,
        failed_suites = 0,
        failed_tests = 0,
        total_suites = 0,
        total_tests = 0,
        results = {},
    }
}

M.passed_suite_ratio = function ()
    return "[" .. M._cache.passed_suites .. "/" .. M._cache.total_suites .. "]"
end

local passed_tests_ratio = function ()
    return "[" .. M._cache.passed_tests .. "/" .. M._cache.total_tests .. "]"
end

local failed_suite_ratio = function ()
    return "[" .. M._cache.failed_suites .. "/" .. M._cache.total_suites .. "]"
end

local failed_tests_ratio = function ()
    return "[" .. M._cache.failed_tests .. "/" .. M._cache.total_tests .. "]"
end

M.get_failing_test_files = function ()
    local failing = {}
    for _, result in pairs(M._cache.results) do
        if result.name then
            table.insert(failing, result.name)
        end
    end
    return failing
end

M.exit = function ()
    local smsg = {
        "Passed Suites: " .. M.passed_suite_ratio(),
        "Passed tests: " .. passed_tests_ratio()
    }
    vim.notify(smsg, vim.log.INFO, {
        title = "Test Driver Jest",
        timeout = 2000,
        on_close = function ()
            if M._cache.failed_suites > 0 then
                local failing = M.get_failing_test_files()
                local fmsg = {
                    "Failed Suites: " .. failed_suite_ratio(),
                    "Failed tests: " .. failed_tests_ratio(),
                }
                for _, i in pairs(failing) do
                    table.insert(fmsg, i)
                end
                vim.notify(fmsg, vim.log.levels.WARN, {
                    title = "Test Driver Jest",
                })
            end
        end
    })

end

M._run_test = function ()
    vim.notify = require("notify")
    vim.notify("Starting jest tests ...", vim.log.levels.INFO, {
        title = "Test Driver",
        timeout = 1000,
    })

    vim.fn.jobstart(M._cmd, {
        stdout_buffered = true,
        on_stdout = function (_, data)
           if not data then
                return
           end

           for _, line in ipairs(data) do
                pcall(function ()
                    local decoded = vim.json.decode(line)

                    if decoded.numFailedTestSuites then
                        M._cache.failed_suites = decoded.numFailedTestSuites
                    end
                    if decoded.numPassedTestSuites then
                        M._cache.passed_suites = decoded.numPassedTestSuites
                    end
                    if decoded.numFailedTests then
                        M._cache.failed_tests = decoded.numFailedTests
                    end
                    if decoded.numPassedTests then
                        M._cache.passed_tests = decoded.numPassedTests
                    end
                    if decoded.numTotalTestSuites then
                        M._cache.total_suites = decoded.numTotalTestSuites
                    end
                    if decoded.numTotalTests then
                        M._cache.total_tests = decoded.numTotalTests
                    end
                    if decoded.testResults then
                        M._cache.results = decoded.testResults
                    end
                end)
           end

        end,
        on_exit = function ()
            M.exit()
        end
    })
end

return M
