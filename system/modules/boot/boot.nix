{ config, pkgs, lib, ... }:

{

#=> SystemD-Boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "auto";
  boot.loader.efi.canTouchEfiVariables = false;

#=> Enable "Silent Boot".
  boot.loader.timeout = 5;
  boot.plymouth.enable = true;
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;

}
