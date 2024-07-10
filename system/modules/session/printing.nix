{ config, pkgs, lib, ... }:

{
  #= Printers
    services.printing = {
        enable = true;
        drivers = with pkgs; [
            #hplip
        ];
    };
}
