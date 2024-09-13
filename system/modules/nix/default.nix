{ config, pkgs, lib, inputs, ... }: {

    imports = [
        ./lix.nix
        ./nix-ld.nix
        ./nix-index.nix
    ];

  #= Enable Nix-Shell, Flakes and More...
    nix = {
        settings = {
            sandbox = true;
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes" ];
            trusted-users = ["rick"];
            substituters = [
                "https://nix-community.cachix.org"
                "https://cache.garnix.io"
                "https://hyprland.cachix.org"
            ];
            trusted-public-keys = [
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
                "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            ];
        };
    #= Clean Nix
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 1w";
        };
    };

}
