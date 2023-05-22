vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({with_sync = true})
            ts_update()
        end
    }
    use 'nvim-treesitter/playground'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'

    -- colorschemes
    use 'ellisonleao/gruvbox.nvim'
    use 'rebelot/kanagawa.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use 'theprimeagen/harpoon'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            {'neovim/nvim-lspconfig'},
            {
              'williamboman/mason.nvim',
              run = function()
                pcall(vim.cmd, 'MasonUpdate')
              end,
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
        }
    }

    use 'rcarriga/nvim-notify'
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'

    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            'mfussenegger/nvim-dap'
        }
    }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    -- Dap default configs
    use 'mfussenegger/nvim-dap-python'
    use 'leoluz/nvim-dap-go'

    -- Fix Lua Ls to provide auto completion for vim api
    use 'folke/neodev.nvim'

    -- Toggle inverse values for booleans and other configured pairs
    use 'rmagatti/alternate-toggler'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true,
        }
    }

    use {
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup({
                disable_filetypes = {
                    'TelescopePrompt',
                    'vim',
                }
            })
        end
    }

end)
