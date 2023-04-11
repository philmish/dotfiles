local go_d = require("td.go_driver")
local js_d = require("td.js_driver")
local php_d = require("td.php_driver")
local py_d = require("td.python_driver")

local M = {}

M._curr_ft = nil
M._loaded_driver = nil

M.drivers = {
    ["go"] = go_d,
    ["javascript"] = js_d,
    ["php"] = php_d,
    ["python"] = py_d,
}

M.load_driver = function (lang)
    M._loaded_driver = M.drivers["javascript"]
    if M._loaded_driver == nil then
        print("Found no driver for current file type ", M._curr_ft)
    end
end

M._load_ft = function ()
    M._curr_ft = vim.bo.filetype
end

M._detect_ft = function ()
    if vim.bo.filetype == "php" then
        print("php")
    elseif vim.bo.filetype == "javascript" then
        print("javascript")
    else
        print("Unknow ft ", vim.bo.filetype)
    end
end

M.run_tests = function ()
    M._load_ft()
    M.load_driver()
    if M._loaded_driver == nil then
        print("No driver for current file type ", M._curr_ft)
        return
    end
    M._loaded_driver._run_test()
end

return M
