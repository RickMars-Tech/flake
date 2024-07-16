{ config, pkgs, lib, ... }: {

  programs.nix-index = {
      enable = true;
      enableFishIntegration = true;
  };
}
