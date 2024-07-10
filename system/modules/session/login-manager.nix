{ config, inputs, pkgs, lib, ... }: let
  
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";

in {

#==> Greetd <==#
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session}";
                user = "greeter";
            };
        };
    };

  #= TTY
    console = {
        earlySetup = true;
        keyMap = "la-latin1";
        packages = with pkgs; [ terminus-nerdfont ];
    };

}
