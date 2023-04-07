-- This lua function will automatically install and setup packer.nvim on any machine
-- you clone your configurations to and ensure packer installation.
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- move this to blog
--[[ Packer Builtins Keywords
init: The init keyword is used in the Packer configuration to specify a function that will be executed before the plugin is initialized. This function is typically used to load any required modules or perform any setup tasks that are necessary before the plugin can be used. The init function is executed in the order in which it is defined in the Packer configuration.
config: The config keyword is used in the Packer configuration to specify a function that will be executed after the plugin is initialized. This function is typically used to perform additional configuration tasks that are required to set up the plugin for use in your Neovim environment. The config function is executed in the order in which it is defined in the Packer configuration, after the init function and plugin initialization.
cmd: The cmd keyword is used in the Packer configuration to specify a command that can be used to trigger a function associated with the plugin. This command can be executed in Neovim's command-line mode, and it is typically used to provide a convenient way to interact with the plugin or trigger specific actions related to the plugin's functionality.
--]]
return require('packer').startup({
    function(use)
        -- Packer will manage itself
        use { "wbthomason/packer.nvim" }
        use { 'lewis6991/impatient.nvim' }
        use { 'nvim-tree/nvim-web-devicons' }
        -- Theme
        -- use {
        --     'nanotech/jellybeans.vim',
        --     as = "jellybeans",
        --     event = "VimEnter",
        --     config = function()
        --         vim.cmd('colorscheme jellybeans')
        --     end,
        -- }
        use {
            "rebelot/kanagawa.nvim",
            event = "VimEnter",
            config = function()
                require("plugins.configs.kanagawa")
                vim.cmd('colorscheme kanagawa')
            end,
        }
        -- Git stuff
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require('gitsigns').setup(require('plugins.configs.git-signs'))
            end,
        }
        -- Treesitter -> syntax highlighting
        use {
            'nvim-treesitter/nvim-treesitter',
            event = "VimEnter",
            run = ":TSUpdate",
            config = [[require('plugins.configs.treesitter')]],
        }
        -- Auto Pair
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup {}
            end,
        }
        -- Plenary -> provide lua functions and Telescope dependency
        use { "nvim-lua/plenary.nvim", module = "plenary" }
        -- Telescope
        -- dependency "ripgrep"
        -- sudo pacman -S ripgrep
        use({
            {
                "nvim-telescope/telescope.nvim",
                init = function()
                    require("plenary")
                end,
                config = function()
                    require("plugins.configs.telescope")
                end,
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                after = "telescope.nvim",
                run = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            {
                "nvim-telescope/telescope-symbols.nvim",
                after = "telescope.nvim"
            },
        })
        -- Status Line
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true },
            config = [[require('plugins.configs.lualine')]]
        }
        -- LSP
        use {
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins.configs.nvimlspconfig")
            end,
        }
        -- Snippet engine
        use({ "L3MON4D3/LuaSnip" })
        -- Code competion
        use({
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-cmdline" }
        })
        use {
            "hrsh7th/nvim-cmp",
            config = [[require('plugins.configs.nvimcmp')]]
        }
    end,
    -- by default packer floating window will show doubled borders.
    -- window appearance configuration
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
