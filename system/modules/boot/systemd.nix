{ config, pkgs, lib, ... }: {

#==> TmpFiles
systemd.tmpfiles.rules = 
    /*let
      rocmEnv = pkgs.symlinkJoin {
        name = "rocm-combined";
        paths = with pkgs.rocmPackages; [
          rocblas
          hipblas
          clr
        ];
      };
    in */ [
      #"L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
      # https://wiki.archlinux.org/title/Gaming#Make_the_changes_permanent.
      "w     /proc/sys/vm/compaction_proactiveness - - - - 0"
      "w     /proc/sys/vm/watermark_boost_factor - - - - 1"
      "w     /proc/sys/vm/min_free_kbytes - - - - 1048576"
      "w     /proc/sys/vm/watermark_scale_factor - - - - 500"
      "w     /proc/sys/vm/swappiness - - - - 10"
      "w     /sys/kernel/mm/lru_gen/enabled - - - - 5"
      "w     /proc/sys/vm/zone_reclaim_mode - - - - 0"
      "w     /sys/kernel/mm/transparent_hugepage/enabled - - - - madvise"
      "w     /sys/kernel/mm/transparent_hugepage/shmem_enabled - - - - advise"
      "w     /sys/kernel/mm/transparent_hugepage/defrag - - - - never"
      "w     /proc/sys/vm/page_lock_unfairness - - - - 1"
      "w     /proc/sys/kernel/sched_child_runs_first - - - - 0"
      "w     /proc/sys/kernel/sched_autogroup_enabled - - - - 1"
      "w     /proc/sys/kernel/sched_cfs_bandwidth_slice_us - - - - 3000"
      "w     /sys/kernel/debug/sched/base_slice_ns  - - - - 3000000"
      "w     /sys/kernel/debug/sched/migration_cost_ns - - - - 500000"
      "w     /sys/kernel/debug/sched/nr_migrate - - - - 8"
      # https://github.com/CachyOS/CachyOS-Settings/blob/master/etc/tmpfiles.d/thp.conf.
      "w!    /sys/kernel/mm/transparent_hugepage/defrag - - - -  defer+madvise"
      "w!    /sys/class/rtc/rtc0/max_user_freq - - - -  3072"
      "w!    /proc/sys/dev/hpet/max-user-freq  - - - -  3072"
      # for some reason *this* is what makes networkmanager not get screwed completely instead of the impermanence module.
      "L     /var/lib/NetworkManager/secret_key - - - - /persist/var/lib/NetworkManager/secret_key"
      "L     /var/lib/NetworkManager/seen-bssids - - - - /persist/var/lib/NetworkManager/seen-bssids"
      "L     /var/lib/NetworkManager/timestamps - - - - /persist/var/lib/NetworkManager/timestamps"
  ];

#==> LACT Service. 
# https://wiki.nixos.org/wiki/AMD_GPU#LACT_-_Linux_AMDGPU_Controller
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd = {
    enable = true; # this is true by default
    wantedBy = [ "multi-user.target" ]; # add this if you want the unit to auto start at boot time 
  };

#=> Polkit Service.
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
        };
    };

#=> Greetd Service
# https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
    systemd.services.greetd.serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal"; # Without this errors will spam on screen
        # Without these bootlogs will spam on screen
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
    };

#==> Extra Configurations
  systemd.extraConfig = ''
      [Manager]
      DefaultLimitNOFILE=2048:2097152
    '';
  systemd.user.extraConfig = ''
      [Manager]
      DefaultLimitNOFILE=2048:1048576
    '';

#==> Jourdnald
  services.journald = {
      extraConfig = ''
          SystemMaxUse=50M
          RuntimeMaxUse=10M
      '';
      rateLimitBurst = 500;
      rateLimitInterval = "30s";
  };
}
