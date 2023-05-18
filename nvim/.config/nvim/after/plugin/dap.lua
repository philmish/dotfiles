local ok, dap = pcall(require, "dap")
if not ok then
    return
end

vim.keymap.set("n", "<leader>b", function ()
    dap.toggle_breakpoint()
end)

vim.keymap.set("n", "<F5>", function ()
    dap.continue()
end)

vim.keymap.set("n", "<F3>", function ()
    dap.step_over()
end)

vim.keymap.set("n", "<F2>", function ()
    dap.step_into()
end)

vim.keymap.set("n", "<F12>", function ()
    dap.step_out()
end)

local ok, virtText = pcall(require, "nvim-dap-virtual-text")
if not ok then
    return
end

local ok, dapui = pcall(require, "dapui")
if not ok then
    return
end

virtText.setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
    dapui.close()
end

require("dap-go").setup()
require("dap-python").setup(os.getenv("HOME") .. "/dev/dap/debugpy/debugpy/bin/python")
