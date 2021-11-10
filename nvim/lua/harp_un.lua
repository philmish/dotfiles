local harp = require('harpoon').setup({
    global_settings = {
                enter_on_sendcmd = true,
        },
    projects = {
        ["$HOME/repos/github.com/pyStrap"] = {
            term = {
                cmds = {
                    "pytest","mypy","flake8 src"
                }
            },
            marks = {
                    "src/pyStrap/CLI/client.py", "src/pyStrap/schemas.py"
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
        ["$HOME/github.com/philmish/go-gem"] = {
            term = {
                cmds = {
                    "go run main.go","go test -v ./...", "go install"
                }
            }
        }
    }
})
