{ config, pkgs, lib, inputs, ... }: {

 #=> WAYDROID <=#
  virtualisation.waydroid.enable = false;

 #=> Enable AMD SEV (For Memory Security).
  #hardware.cpu.amd.sev.enable = true;
  #hardware.cpu.amd.sevGuest.enable = true;
}
