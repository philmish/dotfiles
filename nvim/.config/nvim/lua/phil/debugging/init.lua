local Utils = require("phil.utils")
local nnoremap = Utils.nnoremap

local ok, dap = pcall(require, "dap")
if not ok then return end

nnoremap("<F5>", ":lua require'dap'.continue()<CR>")
nnoremap("<F3>", ":lua require'dap'.step_over()<CR>")
nnoremap("<F2>", ":lua require'dap'.step_into()<CR>")
nnoremap("<F12>", ":lua require'dap'.step_out()<CR>")
nnoremap("<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nnoremap("<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nnoremap("<leader>dr", ":lua require'dap'.repl.open()<CR>")
nnoremap("<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("phil.debugging.node")
require("phil.debugging.php")
