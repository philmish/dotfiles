return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-tree/nvim-web-devicons" },
    { "debugloop/telescope-undo.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = function()
    local builtin = require("telescope.builtin")
    return {
      { "<leader>lg", builtin.live_grep, silent = true },
      { "<leader>ff", builtin.find_files, silent = true },
      { "<leader>fg", builtin.git_commits, silent = true },
      { "<leader>fd", builtin.diagnostics, silent = true },
      { "<leader>fh", builtin.help_tags, silent = true },
    }
  end,
  config = function()
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    --local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        sorting_strategy = "descending",
        selection_strategy = "reset",
        initial_mode = "insert",
        color_devicons = true,
        mappings = {
          i = {
            ["<C-p>"] = actions.move_selection_better,
            ["<C-n>"] = actions.move_selection_worse,
            ["<Esc>"] = actions.close,
            ["<C-c>"] = false,
            ["<M-p>"] = actions_layout.toggle_preview,
            ["<C-Down>"] = actions.cycle_history_next,
            ["<C-Up>"] = actions.cycle_history_prev,
            ["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
          },
          n = {
            ["<C-p>"] = actions.move_selection_better,
            ["<C-n>"] = actions.move_selection_worse,
            ["<M-p>"] = actions_layout.toggle_preview,
            ["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
              preview_height = 0.8,
            },
            mappings = {
              i = {
                ["<CR>"] = require("telescope-undo.actions").yank_additions,
                ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
                ["<C-r>"] = require("telescope-undo.actions").restore,
              },
            },
          },
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>u", ":Telescope undo<CR>")
  end,
}
