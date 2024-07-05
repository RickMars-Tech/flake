{ config, pkgs, lib, ... }:

{

    home.file = {
        ".config/fastfetch/config.jsonc".source = ./config.jsonc;
    };

}
