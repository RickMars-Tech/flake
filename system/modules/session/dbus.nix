{ pkgs, ... }: {

    services.dbus = {
        enable = true;
        implementation = "dbus"; 
        packages = with pkgs; [ 
            dunst
            flatpak
            greetd.greetd
            greetd.tuigreet
        ];
    };

}
