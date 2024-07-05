{ config, pkgs, lib, ... }:

{

    home.file.".config/wlogout" = {
        source = ./config;
        recursive = true;
    };

}
