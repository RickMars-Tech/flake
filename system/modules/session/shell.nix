{ pkgs, ... }: {

#=> Starship <=#
    programs.starship = {
        enable = true;
        settings = {
            add_newline = true;

            directory = {
                format = "[ ](bold #89b4fa)[ $path ]($style)";
                style = "bold #b4befe";
            };

            character = {
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
            #package.disabled = true;
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
