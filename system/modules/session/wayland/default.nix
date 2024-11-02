{ pkgs, ...}: {

    imports = [
        #./cosmic.nix
        ./hyprland.nix
        ./pipewire.nix
        ./waybar.nix
    ];

#= Disable X11
    services.xserver.enable = false;

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
                "application/pdf" = "firefox.desktop";
                "image/png" = "imv.desktop";
                "image/jpg" = "imv.desktop";
                "image/jpeg" = "imv.desktop";
                "image/gif" = "imv.desktop";
                "image/svg" = "imv.desktop";
                "image/tiff" = "imv.desktop";
                "video/avi" = "mpv.desktop";
                "video/mp4" = "mpv.desktop";
                "video/mkv" = "mpv.desktop";
            };
        };
    };

}
