{ config, pkgs, lib, inputs, ... }:

{

  imports = [
      ./amd.nix
      ./packages.nix
      ./power-balance.nix
      ./prismlauncher.nix
      ./steam.nix
  ];

}
