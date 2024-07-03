{ config, pkgs, lib, inputs, ... }:

{

    imports = [
        ./modules/general.nix
    ];

    home = {
        username = "rick";
        homeDirectory = "/home/rick";
        preferXdgDirectories = true;
        stateVersion = "24.11";
    };

#= Wallpapers
    home.file."wal" = {
        source = ./wal;
        recursive = true;
    };

#= DCONF
    dconf = {
        enable = true;
        settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };

#= CURSOR
    home.pointerCursor = {
        gtk.enable = true;
        #x11.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
    };

#= GTK
    gtk = {
        enable = true;
        theme = {
            package = pkgs.whitesur-gtk-theme; #pkgs.material-black-colors;
            name = "WhiteSur-Dark"; #"Material-Black-Blueberry";
        };
        iconTheme = {
            package = pkgs.flat-remix-icon-theme;
            name = "Flat-Remix-Blue-Dark";
        };
    };

#= QT
    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style = {
            name = "adwaita-dark";
            package = pkgs.adwaita-qt;
        };
    };
}
