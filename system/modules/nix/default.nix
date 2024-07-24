{ config, pkgs, lib, inputs, ... }: {

    imports = [
        ./nix-ld.nix
        ./nix-index.nix
    ];

  #= Enable Nix-Shell, Flakes and More...
    nix = {
        settings = {
            warn-dirty = true;
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes" ];
            trusted-users = ["rick"];
            substituters = [
                "https://cache.garnix.io"
                "https://hyprland.cachix.org"
            ];
            trusted-public-keys = [
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
