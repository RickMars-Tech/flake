{ config, pkgs, lib, inputs, ... }: {

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

#==> Hyprland Packages Needed
  environment.systemPackages = with pkgs; [
    # Terminal
    #kitty
    foot
    zellij
    # Top bar
    #eww
    # Hyprland
    hyprland-protocols
    hyprcursor # The hyprland cursor format, library and utilitie
    # Wayland - Kiosk. Used for login_managers
    cage
    # Notification Deamon
    dunst
    libnotify
    notify
    # Wallpaper
    hyprpaper
    # App-Launcher
    rofi-wayland
    # Applets
    #networkmanagerapplet
    # Screen-Locker
    wlogout
    #kanshi # To turn a laptop's internal screen off when docked.
    hyprpicker # Wlroots-compatible Wayland color picker that does not suck
    # Brightnes Manager
    brightnessctl
    # Media CMD Utility
    #playerctl
    # Clipboard-specific
    wl-clipboard-rs
    # Screenshot
    grimblast # Taking
    slurp # Selcting
    swappy # Editing
  #= Polkit
    polkit
    polkit_gnome
    # Image Viewer
    imv
    # Theme's
    #adwaita-qt
    #adwaita-qt6
    #qgnomeplatform
    #qgnomeplatform-qt6
    # XWayland/Wayland
    glfw
    wlr-randr
    wlroots
    wayland-utils
    xwayland
    xwayland-run
    xwaylandvideobridge
];
}
