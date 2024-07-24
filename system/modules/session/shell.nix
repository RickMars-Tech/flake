{ config, pkgs, lib, ... }: {

  #=> Fish <=#
    programs.fish = {
        enable = true;
        useBabelfish = true;
        promptInit = "set fish_greeting";
        shellAliases = {
            grep = "rg --color=auto";
            cat = "bat --style=plain --paging=never";
            la = "eza -a --color=always --group-directories-first --grid --icons";
            ls = "eza -al --color=always --group-directories-first --grid --icons";
            ll = "eza -l --color=always --group-directories-first --octal-permissions --icons";
            lt = "eza -aT --color=always --group-directories-first --icons";
            tree = "eza -T --all --icons";
            search = "fzf";
            hw = "hwinfo --short";
            ntop = "zfxtop";
            changemac = "macchanger -r";
            resetmac = "macchanger -p";
        };
        interactiveShellInit = "

            if set -q ZELLIJ
            else
                zellij
            end

            function fish_greeting 
                fastfetch
            end

            ## Enable Wayland Support for different Applications
            if [ '$XDG_SESSION_TYPE' = 'wayland' ]
                set -gx WAYLAND 1
                set -gx QT_QPA_PLATFORM 'wayland;xcb'
                set -gx GDX_BACKEND 'wayland,x11'
                set -gx MOZ_DBUS_REMOTE 1
                set -gx MOZ_ENABLE_WAYLAND 1
                set -gx _JAVA_AWT_WM_NONREPARENTING 1
                set -gx BEMENU_BACKEND wayland
                set -gx ECORE_EVAS_ENGINE wayland_egl
                set -gx ELM_ENGINE wayland_egl
            end

        ";
        vendor = {
            config.enable = true;
            completions.enable = true;
            functions.enable = true;
        };
    };
    programs.nix-index.enableFishIntegration = true;

  #=> Starship <=#
    programs.starship = {
        enable = true;
        settings = {
            add_newline = false;

            directory = {
                format = "[ ](bold #89b4fa)[ $path ]($style)";
                style = "bold #b4befe";
            };

            character = {
                # Old 
                #success_symbol = "[<0> ~](bold green)$username$directory(bold green)";
                #error_symbol = "[<0> ~](bold red)$username$directory(bold red)";
                success_symbol = "[ ](bold #89b4fa)[ ➜](bold green)";
                error_symbol = "[ ](bold #89b4fa)[ ➜](bold red)";
            };

            cmd_duration = {
                format = "[󰔛 $duration]($style)";
                disabled = false;
                style = "bg:none fg:#f9e2af";
                show_notifications = false;
                min_time_to_notify = 60000;
            };

            /* shell = {
                disabled = false;
                format = "$indicator";
                fish_indicator = "(bright-white) ";
                bash_indicator = "(bright-white) ";
            };

            nix_shell = {
                symbol = "";
                format = "[$symbol$name]($style) ";
                style = "bright-purple bold";
            }; */

            package.disabled = true;
        };
    };

  #=> Direnv <=#
    programs.direnv = {
        enable = true;
        package = pkgs.direnv;
        silent = true;
        loadInNixShell = true;
        direnvrcExtra = "";
        nix-direnv = {
            enable = true;
            package = pkgs.nix-direnv;
        };
    };

}
