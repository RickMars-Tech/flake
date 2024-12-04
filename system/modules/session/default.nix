{ ... }: {

    imports = [
        ./user/default.nix
        ./wayland/default.nix
        ./dbus.nix
        ./drives.nix
        ./env.nix
        ./flatpak.nix
        ./login-manager.nix
        ./network.nix
        ./packages.nix
        ./powermanagment.nix
        ./printing.nix
        #./shell.nix
        ./virtualization.nix
    ];
}
