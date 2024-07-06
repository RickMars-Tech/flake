{ config, pkgs, lib, ... }:

{

    home.file.".config/rofi/themes" = {
        source = ./themes;
        recursive = true;
    };

    programs.rofi = {
        enable = true;
        cycle = false;
        configPath = "./config.rasi";
    };

}
