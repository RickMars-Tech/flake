{ config, pkgs, lib, ... }:

{

    home.file.".config/hypr" = {
        source = ./config;
        recursive = true;
    };

}
