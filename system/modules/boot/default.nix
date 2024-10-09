{ ... }: {

    imports = [
        #./linux-mars/mars.x86_64-linux.nix
        ./boot.nix
        ./kernel.nix
        ./security.nix
        ./systemd.nix
        ./udev.nix
    ];

}
