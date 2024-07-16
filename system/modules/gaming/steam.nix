{ config, pkgs, lib, ... }: {

 #=> Steam <=#
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        extest.enable = true; # For using Steam Input on Wayland
        extraCompatPackages = [
            pkgs.proton-ge-bin # GloriousEggroll custom Proton
        ];
        protontricks.enable = true;
        package = pkgs.steam.override {
            extraPkgs = pkgs:
                with pkgs; [
                    xorg.libXcursor
                    xorg.libXi
                    xorg.libXinerama
                    xorg.libXScrnSaver
                    libpng
                    libpulseaudio
                    libvorbis
                    libkrb5
                    stdenv.cc.cc.lib
                    keyutils
                ];
        };
    };
 #= Enable Steam Hardware Udev Rules
    hardware.steam-hardware.enable = true;

 #=> Gamescope <=#
    programs.gamescope = {
        enable = true;
        package = pkgs.gamescope;
        capSysNice = true;
    };

}
