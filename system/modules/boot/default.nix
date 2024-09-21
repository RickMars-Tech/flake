{ ... }: {

    imports = [
        ./boot.nix
        ./kernel.nix
        ./security.nix
        ./systemd.nix
        ./udev.nix
    ];

}
