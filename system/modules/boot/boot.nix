{ config, pkgs, lib, ... }:

{

#=> SystemD-Boot.
    boot = {
        loader = {
            systemd-boot.enable = true;
            systemd-boot.consoleMode = "keep";
            efi.canTouchEfiVariables = true;
            systemd-boot.configurationLimit = 15;
    #=> Enable "Silent Boot".
            timeout = 5;
        };
        plymouth.enable = true;
        initrd.verbose = false;
        consoleLogLevel = 0;
    #=> Tpmfs
        tmp = {
            useTmpfs = true;
            cleanOnBoot = true;
        };
    };
}
