{ config, pkgs, lib, ... }:

{

    environment.systemPackages = with pkgs; [
        glfw-wayland-minecraft
        (prismlauncher.override { 
            jdks = [ jdk19 jdk17 jdk8 ];
            gamemodeSupport = true;
        })
    ];

}
