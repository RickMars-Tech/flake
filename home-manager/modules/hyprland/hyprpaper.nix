{ config, pkgs, pkgs-stable, lib, inputs, ... }: {

    services.hyprpaper = {
        enable = true;
        package = pkgs-stable.hyprpaper;
        settings = {
            ipc = "on";
            splash = false;
            splash_offset = 2.0;

            preload =
                [ "~/wal/arcane.png" "~/wal/spaceman.png" "~/wal/alone.png" ];
            wallpaper = 
                [ "eDP-1,~/wal/alone.png" ];
        };
    };

}
