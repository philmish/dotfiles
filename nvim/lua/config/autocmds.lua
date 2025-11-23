local api = vim.api

local ft_set_group = api.nvim_create_augroup('set_ft', { clear = true })
local pre_write_fmt_group = api.nvim_create_augroup('pre_write_fmt', { clear = true })

-- set the filetype for terraform related files
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { group = ft_set_group, pattern = {"*.tf", "*.tfvars"}, command = "set filetype=terraform" }
)

-- remove trailing whitespaces before file write for all filetypes
api.nvim_create_autocmd(
  {"BufWritePre"},
  {
    group = pre_write_fmt_group,
    pattern = {"*"},
    callback = function ()
      local save_cursor = vim.fn.winsaveview()
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.winrestview(save_cursor)
    end
  }
)
