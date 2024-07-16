{ config, pkgs, lib, ... }: {

    programs.git = {
        enable = true;
        lfs.enable = true;
    };

}
