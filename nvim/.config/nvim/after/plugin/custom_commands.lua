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


