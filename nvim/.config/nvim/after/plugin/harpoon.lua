require('harpoon').setup({
    global_settings = {
                enter_on_sendcmd = true,
        },
    projects = {
        ["$HOME/code/repos/dotfiles"] = {
            marks = {
                    "nvim/.config/nvim/init.vim",
                }
        }
    }
})


