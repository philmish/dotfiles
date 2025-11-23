local olocal = vim.opt_local
local api = vim.api

olocal.tabstop = 2
olocal.shiftwidth = 2
olocal.softtabstop = 2

local json_ft = api.nvim_create_augroup('json_ft', { clear = true })

-- use jq to format json files
api.nvim_create_autocmd(
  {"BufWritePre"},
  {
    group = json_ft,
    pattern = {"*.json"},
    callback = function ()
      local save_cursor = vim.fn.winsaveview()
      -- use pcall to avoid crash if jq is not installed
      pcall(function ()
        vim.cmd([[ :%! jq --indent 2 . ]])
      end)
      vim.fn.winrestview(save_cursor)
    end,
  }
)
