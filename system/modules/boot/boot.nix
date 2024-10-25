{ ... }: {

    boot = {
        loader = {
            systemd-boot = {
                enable = true;
                editor = false;
                consoleMode = "max";
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
    };
}
