local api = vim.api

local ft_set_group = api.nvim_create_augroup('set_ft', { clear = true })

-- set the filetype for terraform related files
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { group = ft_set_group, pattern = {"*.tf", "*.tfvars"}, command = "set filetype=terraform" }
)

