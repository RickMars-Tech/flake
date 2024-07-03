{ config, pkgs, lib, ... }:

{

    home.file.".config/hypr" = {
        source = ./hyprlnd;
        recursive = true;
    };

}
