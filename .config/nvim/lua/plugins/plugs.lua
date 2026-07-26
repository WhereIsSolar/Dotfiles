return {
  -- { 
  --   "catppuccin/nvim", 
  --   name = "catppuccin", 
  --   priority = 1000,
  --   lazy = false,
  --   config = function(_, opts)
  --       require("catppuccin").setup(opts)
  --       vim.cmd.colorscheme("catppuccin-mocha")
  --   end
  --   },
  
    { 
    "rebelot/kanagawa.nvim", 
    priority = 1000,
    lazy = false,
    opts = {
        theme = "wave",
        transparent = true, 
        background = { dark = "wave", light = "lotus"}
    },
    config = function(_, opts)
        require("kanagawa").setup(opts)
        vim.cmd.colorscheme("kanagawa")
    end
},

  {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            theme = "auto",
            section_separators = { left = '', right = '' },
            component_separators = { left = '>', right = '<' },
            },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"filename"},
            lualine_c = {"branch",
                         "diff",
                            { -- Обратите внимание на дополнительные фигурные скобки здесь
                                'diagnostics',
                                sources = { 'nvim_lsp' },
                                sections = { 'error', 'warn', 'info', 'hint' },
                                diagnostics_color = {
                                    error = 'DiagnosticError',
                                    warn  = 'DiagnosticWarn',
                                    info  = 'DiagnosticInfo', 
                                    hint  = 'DiagnosticHint',
                                },
                                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                                colored = true,
                                update_in_insert = false,
                                always_visible = false,
    }
            },
            lualine_x = {"lsp_status"},
            lualine_y = {"encoding","filesize","progress"},
            lualine_z = {"location"},                
            }
        }
    },

   {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
    end,
    },

    {
    'nvim-telescope/telescope.nvim', 
     tag = '0.1.8', 
     dependencies = { 'nvim-lua/plenary.nvim' },
     lazy = false,
     priority = 1000,
    },

    {
    "sphamba/smear-cursor.nvim",
     opts ={cursor_color = "ff8800", },
    },

    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},

    {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end,
    },

    -- { 'echasnovski/mini.nvim', version = '*' },

    {'numToStr/Comment.nvim',
    opts = {
        -- add any options here
        },
    lazy = false,
    priority = 500,
    },
    
    {'ap/vim-css-color',
    lazy = false,
    priority = 500,
    },

  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     
  --   },
  -- },
  --   {
  --   "odysseyalive/kitty-themes.nvim",
  --   lazy = true,
  --   priority = 500,
  --   config = function()
  --     require("kitty-themes").setup({
  --       -- Configuration options
  --       transparent = false,
  --       term_colors = true,
  --     })
  --   end,
  -- },
    
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    version = '*',
    lazy = false,
    priority = 500,
  },

}
-- {
    --  'https://gitlab.com/itaranto/plantuml.nvim',
    -- version = '*',
    -- config = function() require('plantuml').setup() end,
    -- },


    -- ap / vim-css-color; commentary.vim
    --{--{
        --'diagnostics',
        --sources = {'nvim_diagnostic'},
        --symbols = {error = ' ', warn = ' ', info = ' '},
        --diagnostics_color = {
            --error = {fg = '#ff0000'},
            --warn = {fg = '#ff0000'},
            --info = {fg = '#ff0000'},
            --},
            --colored = true,
            --always_visible = true,
            --update_in_insert = true
            --}

            --'diagnostics',
            --sources = {'nvim_diagnostic'},
            --symbols = {error = ' ', warn = ' ', info = ' '},
            --diagnostics_color = {
                --error = {fg = '#ff0000'},
                --warn = {fg = '#ff0000'},
                --info = {fg = '#ff0000'},
                --},
                --colored = true,
                --always_visible = true,
                --update_in_insert = true
                --}

