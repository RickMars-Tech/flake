{ config, pkgs, lib, inputs, ...}:

{
    imports = [
        ./hyprland.nix
        ./pipewire.nix
        ./waybar.nix
        ./waydroid.nix
    ];

 #= XWayland
  programs.xwayland.enable = true;

 #= XDG
  xdg = {
    portal = {
        enable = true;
        config.common.default = "gtk";
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            libsForQt5.xdg-desktop-portal-kde
            lxqt.xdg-desktop-portal-lxqt
        ];
    };
    sounds.enable = true;
    autostart.enable = true;
    menus.enable = true;
    mime = {
        enable = true;
        defaultApplications = {
            "image/png" = [
                "imv.desktop"
            ];
        };
    };
  };

}
