local go_d = require("td.go_driver")
local js_d = require("td.js_driver")
local php_d = require("td.php_driver")
local py_d = require("td.python_driver")

local M = {
    _curr_ft = nil,
    _loaded_driver = nil,
    drivers = {
        ["go"] = go_d,
        ["javascript"] = js_d,
        ["php"] = php_d,
        ["python"] = py_d,
    }
}

M.load_driver = function (lang)
    M._loaded_driver = M.drivers[lang]
    if not M._loaded_driver then
        print("Found no driver for current file type ", M._curr_ft)
    end
end

M._load_ft = function ()
    M._curr_ft = vim.bo.filetype
end

M.run_tests = function ()
    M._load_ft()
    M.load_driver(M._curr_ft)
    if not M._loaded_driver then
        print("No driver for current file type ", M._curr_ft)
        return
    end
    if not M._loaded_driver._run_test then
        print("Current driver does not implement test running: ", M.load_driver)
        return
    end
    M._loaded_driver._run_test()
end

return M
