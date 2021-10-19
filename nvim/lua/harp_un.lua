local harp = require('harpoon').setup({
    projects = {
        ["$HOME/repos/github.com/pyStrap"] = {
            term = {
                cmds = {
                    "pytest","mypy","flake8 src"
                }
            }
        },
        ["$HOME/repos/github.com/memexServer"] = {
            term = {
                cmds = {
                    "pytest","mypy","flake8 src"
                }
            }
        },
        ["$HOME/repos/github.com/rake"] = {
            term = {
                cmds = {
                    "pytest","mypy","flake8 src"
                }
            }
        },
        ["$HOME/go/src"] = {
            term = {
                cmds = {
                    "go run main.go","go test", "go install"
                }
            }
        }
    }
})