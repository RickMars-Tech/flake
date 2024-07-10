{ config, pkgs, lib, ... }:

{

    imports = [
        ./dri/default.nix
        ./dunst/default.nix
        ./fastfetch/default.nix
        ./firefox/default.nix
        ./foot/default.nix
        ./hyprland/default.nix
        #./kitty/default.nix
        ./mpv/default.nix
        ./rofi/default.nix
        ./steam/default.nix
        ./waybar/default.nix
        ./wlogout/default.nix
    ];

}
