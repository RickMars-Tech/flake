{ config, pkgs, lib, inputs, ... }:

{

#= Scheduler System-76
  services.system76-scheduler = {
      enable = lib.mkDefault true;
      useStockConfig = lib.mkDefault true;
  };

#= IRQBalance
  services.irqbalance.enable = lib.mkDefault true;

#= Ananicy
  services.ananicy = {
      enable = lib.mkDefault true;
      package = lib.mkDefault pkgs.ananicy-cpp;
      rulesProvider = lib.mkDefault pkgs.ananicy-rules-cachyos; 
      settings = {
          apply_nice = true;
          apply_ioclass = true;
          apply_ionice = true;
          apply_sched = true;
          apply_oom_score_adj = true;
          apply_cgroup = true;
          check_disks_schedulers = true;
          check_freq = 10;
          cgroup_load = true;
          type_load = true;
          rule_load = true;
      };
  };

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
