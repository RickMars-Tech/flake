{ pkgs, lib, ... }: {

#=> IRQBalance
    services.irqbalance.enable = lib.mkDefault true;

#=> Gamemode
    programs.gamemode = {
        enable = true;
        enableRenice = lib.mkDefault true;
        settings = {
            general = {
                renice = 10;
                inhibit_screensaver = 0;
            };    
            gpu = {
                apply_gpu_optimisations = "accept-responsibility";
                amd_performance_level = "high";
            };
            cpu = {
                park_cores = "no";
                pin_cores = "yes";
            };
            custom = {
                start = "${pkgs.libnotify}/bin/notify-send 'GameMode Started'";
                end = "${pkgs.libnotify}/bin/notify-send 'GameMode Ended'";
            };
        };
    };

}
