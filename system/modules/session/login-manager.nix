{ inputs, pkgs, ... }: let
  
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";

in {

#==> Greetd <==#
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${tuigreet} --time --remember --remember-session --asterisks --sessions ${hyprland-session}";
                user = "greeter";
            };
        };
        vt = 1;
    };

#= TTY
    console = {
        earlySetup = true;
        keyMap = "us"; #"la-latin1";
        packages = with pkgs; [ terminus-nerdfont ];
    };

}
