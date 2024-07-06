{ config, pkgs, lib, inputs, ... }:

{
#==>~HYPRLAND~<==#

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    systemd.setPath.enable = true;
    xwayland.enable = true;
  };

  # Hyprlock
  programs.hyprlock.enable = true;

  # Hypridle
  services.hypridle.enable = true;

}
