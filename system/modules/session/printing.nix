{ config, pkgs, lib, ... }: {

  #= Printers
    services.printing = {
        enable = true;
        drivers = with pkgs; [
            gutenprint
            hplipWithPlugin
        ];
    };

    environment.systemPackages = with pkgs; [
        hplipWithPlugin
    ];
}
