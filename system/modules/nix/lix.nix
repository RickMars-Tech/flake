{ config, pkgs, lib, inputs, ... }: {

    # Just use Lix...
    nix.package = pkgs.lix;

}
