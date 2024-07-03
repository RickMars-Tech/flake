{ config, pkgs, lib, ... }:

{

    home.file.".config/mpv" = {
        source = ./mpv;
        recursive = true;
    };

}
