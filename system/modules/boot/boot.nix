{ config, pkgs, lib, ... }:

{

#=> SystemD-Boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "keep";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 20;

#=> Enable "Silent Boot".
  boot.loader.timeout = 5;
  boot.plymouth.enable = true;
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;

}
