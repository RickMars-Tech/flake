{ config, pkgs, lib, input, ...}: {

#==> Declare Flatpak Config/Packages <==#

    services.flatpak = {
        enable = true;
        remotes = [{
            name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }];
    #= Declare packages to install with ID of the Aplication
        packages = [
            "io.github.hmlendea.geforcenow-electron"
            "com.boxy_svg.BoxySVG"
            "com.github.tchx84.Flatseal"
            #= Qt IDE's
            "io.qt.Designer"
            "io.qt.QtCreator"
            "io.qt.qdbusviewer"
            "io.qt.Linguist"
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

}
