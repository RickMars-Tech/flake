{ config, pkgs, lib, ... }: {

    services.hyprpaper = {
        enable = true;
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
