{ config, pkgs, lib, ... }: {

    xdg.configFile."wireplumber/main.lua.d" = {
        source = ./config;
        recursive = true;
    };

}