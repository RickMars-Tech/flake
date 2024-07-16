{ config, pkgs, lib, ... }: {

    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = true;
            splash_offset = 2.0;

            preload =
                [ "~/wal/arcane.png" "~/wal/spaceman.png" "~/wal/alone.png" ];
            wallpaper = 
                [ "DP-1,~/wal/alone.png" ];
        };
    };

}
