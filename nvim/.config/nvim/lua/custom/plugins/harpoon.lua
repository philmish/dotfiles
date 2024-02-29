return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()

      vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
      vim.keymap.set("n", "<leader>hm", require("harpoon.ui").toggle_quick_menu)

      for i = 1, 5 do
        vim.keymap.set("n", string.format("<leader>%s", i), function()
          require("harpoon.ui").nav_file(i)
        end)
      end
    end
  },
}
