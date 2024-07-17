{ config, pkgs, lib, inputs, ... }: {

#= Scheduler System-76
    services.system76-scheduler = {
        enable = true;
        settings.cfsProfiles.enable = true;
    };

#= IRQBalance
    services.irqbalance.enable = lib.mkDefault true;

#=> Gamemode
    programs.gamemode = {
        enable = true;
        enableRenice = lib.mkDefault true;
        settings = {
            general = {
                renice = 10;
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
