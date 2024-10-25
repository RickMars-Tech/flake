{ ... }: {

#==> Declare Flatpak Config/Packages <==#

    /*services.flatpak = {
        enable = true;
        remotes = [{
            name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }];
    #= Declare packages to install with ID of the Aplication
        packages = [
            "io.github.hmlendea.geforcenow-electron"
            #"io.github.thetumultuousunicornofdarkness.cpu-x"
            #"com.boxy_svg.BoxySVG"
            "com.github.tchx84.Flatseal"
            #= Qt IDE's
            #"io.qt.Designer"
            #"io.qt.QtCreator"

        ];
        overrides = {
            global = {
            # Force Wayland by default
                #Context.sockets = ["wayland" "!x11" "!fallback-x11"];

                Environment = {
                    # Fix un-themed cursor in some Wayland apps
                    XCURSOR_THEME = "Bibata-Modern-Classic";
                    XCURSOR_SIZE = "24";

                    # Force correct theme for some GTK apps
                    GTK_THEME = "WhiteSur-Dark";
                };
            };
        };
        update.onActivation = true;
        uninstallUnmanaged = true;
    };*/


    services.flatpak = {
        enable = true;
        remotes = { 
            "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        };
        packages = [
            "flathub:app/io.github.hmlendea.geforcenow-electron/x86_64/stable"
            "flathub:app/io.github.thetumultuousunicornofdarkness.cpu-x/x86_64/stable"
            "flathub:app/com.github.tchx84.Flatseal/x86_64/stable"
        ];
        overrides = {
            "global" = {
                filesystems = [
                    "home"
                ];
                /*sockets = [
                    "!wayland"
                    "!fallback-x11"
                    "!x11"
                ];*/
            };
            "io.github.hmlendea.geforcenow-electron" = {
                environment = { };
                /*sockets = [
                    "x11"
                    "!fallback-x11"
                ];*/
            };
        };
    };

}
