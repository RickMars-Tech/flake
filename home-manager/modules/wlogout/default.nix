{ config, pkgs, lib, ... }:

{

    home.file.".config/wlogout" = {
        source = ./wlog;
        recursive = true;
    };

}
