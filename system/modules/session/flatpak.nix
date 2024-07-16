{ config, pkgs, lib, input, ...}: {

#==> Declare Flatpak Config/Packages <==#

    services.flatpak = {
        enable = true;
        remotes = lib.mkOptionDefault [{
            name = "flathub-beta";
            location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
        }];
    #= Declare packages to install with ID of the Aplication
        packages = [
            "io.github.hmlendea.geforcenow-electron"
            "com.boxy_svg.BoxySVG"
            "com.github.tchx84.Flatseal"
        ];
        overrides = {
            global = {
            # Force Wayland by default
                Context.sockets = ["wayland" "!x11" "!fallback-x11"];

                Environment = {
                    # Fix un-themed cursor in some Wayland apps
                    XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

                    # Force correct theme for some GTK apps
                    GTK_THEME = "Adwaita:dark";
                };
            };
        };
    };

 #= Dbus
    services.dbus = {
        enable = true;
        implementation = "broker"; 
        packages = with pkgs; [ flatpak ];
    };
}
