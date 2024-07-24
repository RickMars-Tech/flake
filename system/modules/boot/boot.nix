{ config, pkgs, lib, ... }: {

    boot = {
        loader = {
            systemd-boot.enable = true;
            systemd-boot.consoleMode = "keep";
            systemd-boot.configurationLimit = 20;
            efi.canTouchEfiVariables = true;
            timeout = 5;
        };
        initrd = {
            enable = true;
            compressor = "zstd";
            verbose = false;
        };
        tmp = {
            useTmpfs = true;
            cleanOnBoot = true;
        };
        consoleLogLevel = 0;
    };
}
