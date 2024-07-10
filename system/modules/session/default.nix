{ config, lib, pkgs, ...}:

{
    imports = [
        ./drives.nix
        ./env.nix
        ./flatpak.nix
        ./git.nix
        ./login-manager.nix
        ./neovim.nix
        ./network.nix
        ./packages.nix
        ./powermanagment.nix
        ./printing.nix
        ./shell.nix
        ./user.nix
        ./yazi.nix
        ./wayland/default.nix
    ];
}
