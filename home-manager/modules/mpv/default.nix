{ config, pkgs, lib, ... }:

{

    home.file.".config/mpv" = {
        source = ./config;
        recursive = true;
    };

}
