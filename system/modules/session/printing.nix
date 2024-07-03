{ config, pkgs, lib, ... }:

{
#= Printers
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    hplip
  ];
}
