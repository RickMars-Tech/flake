{ config, pkgs, lib, ... }:

{

    home.file.".config/rofi" = {
        source = ./rofi;
        recursive = true;
    };

}
