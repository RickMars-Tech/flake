{ config, pkgs, lib, ... }:

{
#= File Managers
  # Yazi
  programs.yazi = {
      enable = true;
      settings.yazi = {
        keymap = "la-latin1";
      };
      package = pkgs.yazi;
  };
}
