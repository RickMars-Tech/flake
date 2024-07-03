{ config, lib, pkgs, inputs, ... }:

{
    imports = [
        ./boot/default.nix
        ./gaming/default.nix
        ./nix/default.nix
        ./session/default.nix
    ];
}
