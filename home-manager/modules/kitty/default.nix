{ config, pkgs, lib, ... }:

{

    home.file = {
        ".config/kitty/kitty.conf".source = ./kitty.conf;
        ".config/kitty/theme.conf".source = ./theme.conf;
    };

}
