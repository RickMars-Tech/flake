{ config, pkgs, lib, ... }: {

 #= Neovim
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        withPython3 = true;
        package = pkgs.neovim-unwrapped;
        configure = {
            customRC = ''

                syntax on
                set ignorecase
                set smartcase
                set encoding=utf-8
                set number relativenumber

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
            packages.myVimPlugins = with pkgs.vimPlugins; {
                start = [
                    coc-rust-analyzer
                    indentLine
                    neo-tree-nvim
                    nui-nvim
                    nvim-dap
                    nvim-web-devicons
                    oxocarbon-nvim
                    plenary-nvim
                    vim-lastplace 
                    vim-nix
                    vim-just
                    vim-nixhash
                ];
                opt = [ ]; 
            };
        };
    };
}
