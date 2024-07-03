{ config, pkgs, lib, inputs, ... }:

{
 #=> NixLD <=#
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
    libraries = pkgs.steam-run.fhsenv.args.multiPkgs pkgs;
  };
  services.envfs.enable = true;
}
