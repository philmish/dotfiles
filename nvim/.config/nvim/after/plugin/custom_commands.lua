-- Use https://github.com/chubin/cheat.sh from inside nvim
local function curl_to_split(url)
    vim.api.nvim_command("vsplit")
    vim.api.nvim_command("terminal curl " .. url)
end

vim.api.nvim_create_user_command("ChtLang", function ()
    local lang = vim.fn.input("Lang: ")
    local query = vim.fn.input("Query: ")
    query = string.gsub(query, " ", "+")
    local url = "cht.sh/" .. lang .. "/" .. query
    curl_to_split(url)
end, {})

vim.api.nvim_create_user_command("ChtUtil", function ()
    local util = vim.fn.input("Util: ")
    local url = "cht.sh/" .. util
    curl_to_split(url)
end, {})

-- Set background transparent
vim.api.nvim_create_user_command("BgTransparent", function ()
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end, {})

-- Run CS-Fixer with provided config
vim.api.nvim_create_user_command("CSFix", function (opts)

    local config_path = opts.fargs[1]
    local cmd = "./vendor/bin/php-cs-fixer fix --config " .. config_path
    vim.notify("Running: " .. cmd, vim.log.levels.INFO, {})

    vim.fn.jobstart(cmd, {
        on_stderr = function (_, data)
            if not data then
                return
            end
            for _, line in ipairs(data) do
                pcall(function ()
                    vim.notify("CS-Fixer crashed:  " .. line, vim.log.levels.ERROR, {})
                end)
            end
        end,
        on_exit = function ()
            vim.cmd "edit"
            vim.notify("CS Fixer finished running", vim.log.levels.INFO, {
                title = "Php-CS-Fixer",
                timeout = 500
            })
        end
    })
end, { nargs = 1 })
