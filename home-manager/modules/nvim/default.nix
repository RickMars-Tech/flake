{ pkgs, ... }: {

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        withPython3 = true;
        package = pkgs.neovim-unwrapped;
        extraPackages = with pkgs; [
            rust-analyzer
            nixd
            nixfmt-rfc-style
            pyright
        ];
        extraPython3Packages = pyPkgs: with pyPkgs; [
            #pylsp-mypy
            pyls-isort
            python-lsp-server
            pytest
            pylint
            # python-lsp-ruff
            # pyls-flake8
            # pylsp-rope
            # yapf
            # autopep8
        ];
        plugins = with pkgs.vimPlugins; [
            indent-blankline-nvim
            mason-nvim
            nvim-dap
            nvim-dap-ui
            nvim-dap-python
            nvim-lspconfig
            oxocarbon-nvim
            rustaceanvim
            supermaven-nvim
            vim-airline
            vim-nix
            vim-just
        ];
        extraLuaConfig = ''
            vim.cmd('syntax on')

            vim.o.ignorecase = true
            vim.o.smartcase = true
            vim.o.encoding = 'utf-8'
            vim.o.mouse = 'a'
            vim.o.number = true

            vim.o.wildmode = 'longest,list,full'

            vim.o.clipboard = 'unnamedplus'

            vim.o.expandtab = true
            vim.o.shiftwidth = 4
            vim.o.softtabstop = 4
            vim.o.tabstop = 4

            -- Theme
            vim.o.background = 'dark'
            vim.o.termguicolors = true

            -- Transparency
            vim.cmd('highlight Normal guibg=none')
            vim.cmd('highlight NonText guibg=none')
            vim.cmd('highlight Normal ctermbg=none')
            vim.cmd('highlight NonText ctermbg=none')

            -- Indent Blankline
            local highlight = {
                "RainbowRed", 
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- when the colorscheme is changed
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            require("ibl").setup { indent = { highlight = highlight } }

            -- Supermaven
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<Tab>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-j>",
                },
                ignore_filetypes = { cpp = true }, -- or { "cpp", }
                color = {
                    suggestion_color = "#ffffff",
                    cterm = 244,
                },
                log_level = "info", -- set to "off" to disable logging completely
                disable_inline_completion = false, -- disables inline completion for use with cmp
                disable_keymaps = false, -- disables built in keymaps for more manual control
                condition = function()
                    return false
                end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
            })

            -- LSP Config
            require("lspconfig").rust_analyzer.setup {
            -- Server-specific settings. See `:help lspconfig-setup`
                settings = {
                    ['rust-analyzer'] = {},
                },
            }
            require("lspconfig").nixd.setup({
                cmd = { "nixd" },
                settings = {
                    nixd = {
                        nixpkgs = {
                            expr = "import <nixpkgs> { }",
                        },
                        formatting = {
                            command = { "nixfmt" },
                        },
                    },
                },
            })
            lspconfig.pyright.setup {
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true,
                        },
                        formatting = {
                            provider = "black",
                            black_args = {
                                "--line-length=120",
                            },
                        },
                    }
                },
            };
        '';
    };

}
