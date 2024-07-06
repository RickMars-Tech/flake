{ config, pkgs, lib, inputs, ... }:

{
 #=> NixLD <=#
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
    libraries = pkgs.steam-run.fhsenv.args.multiPkgs pkgs;
  };
  # Fuse filesystem that returns symlinks to executables based on the PATH of the requesting process.
  services.envfs.enable = true;
}
