{ config, pkgs, lib, ... }:

{
#= File Managers
  # Yazi
  programs.yazi = {
      enable = true;
      settings.yazi = {};
      package = pkgs.yazi;
  };
}
