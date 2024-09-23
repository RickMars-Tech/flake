{ pkgs, inputs, ... }: {

    nixpkgs.overlays = [ inputs.fenix.overlays.default ];


    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        withPython3 = true;
        package = pkgs.neovim-unwrapped;
        coc = {
            enable = true;
            settings = {
                "languageserver" = {
                    "nix" = {
                        "command" = "nixd";
                        "filetypes" = ["nix"];
                    };
                };
            };
        };
        extraPackages = with pkgs; [
            (fenix.complete.withComponents [
                "rustfmt"
            ])
            rust-analyzer-nightly
            nodePackages.bash-language-server
            docker-compose-language-service
            dockerfile-language-server-nodejs
            emmet-language-server
            nixd
        ];
        extraPython3Packages = pyPkgs: with pyPkgs; [ 
            python-lsp-server
            flake8
        ];
        plugins = with pkgs.vimPlugins; [
            #coc-rls
            #coc-rust-analyzer
            indent-blankline-nvim
            mason-nvim
            nvim-dap
            oil-nvim
            oxocarbon-nvim
            rustaceanvim
            supermaven-nvim
            vim-airline
            vim-nix
            vim-just
        ];
        extraConfig = ''
            syntax on
            set ignorecase
            set smartcase
            set encoding=utf-8
            set number relativenumber
            set mouse=a

            " Autocompletion
            set wildmode=longest,list,full

            " Use system Clipboard
            set clipboard+=unnamedplus

            " Lines Number
            set number

            " Tab Settings
            set expandtab
            set shiftwidth=4
            set softtabstop=4
            set tabstop=4
            
            " Theme
            set background=dark
            set termguicolors 

            " Transparency
            highlight Normal guibg=none
            highlight NonText guibg=none
            highlight Normal ctermbg=none
            highlight NonText ctermbg=none
        '';
        extraLuaConfig = ''
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
            require("oil").setup({
                default_file_explorer = true,
            })
        '';
    };

}
