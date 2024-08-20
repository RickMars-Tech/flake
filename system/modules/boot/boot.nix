{ config, pkgs, lib, ... }: {

    boot = {
        loader = {
            systemd-boot = {
                enable = true;
                consoleMode = "keep";
                configurationLimit = 20;
            };
            efi.canTouchEfiVariables = false;
            timeout = 5;
        };
        initrd = {
            enable = true;
            compressor = "zstd";
            verbose = true;
        };
        tmp = {
            useTmpfs = true;
            cleanOnBoot = true;
        };
        consoleLogLevel = 4;
    };
}
