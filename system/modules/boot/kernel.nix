{ pkgs, ... }: {

    #==> Kernel & Filesystem <==#
    boot = {
        kernelPackages = pkgs.linuxPackages_cachyos; # Latest Kernel.
        supportedFilesystems = [ "ntfs" ]; # Enable Support for Others File Systems.

    #==> Kernel Parameters <==#
        kernelParams = [
            "transparent_hugepage=always"
            #"tsc=reliable"
            #"clocksource=tsc"
            "mitigations=auto"
            #"quiet"
            #"splash"
        ];

    #==> Kernel Modules <==#
        kernelModules = [
            "thinkpad_acpi"
        ];

        #initrd.kernelModules = [];

    #==> Kernel Runtime Parameters <==#
        kernel.sysctl = {
        # https://documentation.suse.com/sbp/server-linux/html/SBP-performance-tuning/index.html#sec-kernel-tuning
        # And
        # https://wiki.archlinux.org/title/Sysctl#Improving_performance
        #= Kernel Tuning
            "kernel.sched_rr_timeslice_ms" = 5;
            "kernel.sched_rt_runtime_us" = -1;
            "kernel.sched_rt_period_us" = 1000000;
            "kernel.numa_balancing" = 0;
            "kernel.unprivileged_userns_clone" = 1;
            "kernel.pid_max" = 32768;
            "kernel.nmi_watchdog" = 0;
        #= Memory Tuning
            "vm.dirty_ratio" = 10;
            "vm.dirty_background_ratio" = 5;
            "vm.dirty_bytes" = 16384;
            "vm.dirty_background_bytes" = 78643200;
            "vm.dirty_writeback_centisecs" = 6000;
            "vm.dirty_expire_centisecs" = 1500;
            "vm.swappiness" = 60;
            "vm.vfs_cache_pressure" = 50;
            "vm.drop_caches" = 3;
            "vm.overcommit_memory" = 1;
            "vm.laptop_mode" = 5;
        #= Networking Stack Tuning
            "net.core.netdev_budget" = 300;
            "net.core.somaxconn" = 128;
            "net.core.busy_poll" = 50;
            "net.core.busy_read" = 50;
            "net.ipv4.tcp_fastopen" = 1;
            "net.core.default_qdisc" = "cake";
            "net.ipv4.tcp_congestion_control" = "bbr";
            "net.ipv4.udp_rmem_min" = 8192;
            "net.ipv4.udp_wmem_min" = 8192;
            "net.core.rmem_max" = 16777216;
            "net.core.wmem_default" = 1048576;
            "net.core.wmem_max" = 16777216;
            "net.core.optmem_max" = 65536;
            "net.ipv4.tcp_rmem" = "4096 1048576 2097152";
            "net.ipv4.tcp_wmem" = "4096 65536 16777216";
            #= https://enterprise-support.nvidia.com/s/article/linux-sysctl-tuning
            "net.ipv4.tcp_timestamps" = 0;
            "net.ipv4.tcp_sack" = 1;
            "net.core.netdev_max_backlog" = 250000;
            "net.ipv4.tcp_low_latency" = 1;
            "net.ipv4.tcp_adv_win_scale" = 1;
        #= Disable Source Routing
            # https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/security_guide/chap-security_guide-securing_your_network
            "net.ipv4.conf.all.accept_source_route" = 0;
            "net.ipv4.conf.all.forwarding" = 0;
            "net.ipv6.conf.all.forwarding" = 0;
            "net.ipv4.conf.all.mc_forwarding" = 0;
            "net.ipv6.conf.all.mc_forwarding" = 0;
            "net.ipv4.conf.all.accept_redirects" = 0;
            "net.ipv6.conf.all.accept_redirects" = 0;
            "net.ipv4.conf.all.secure_redirects" = 0;
            "net.ipv4.conf.all.send_redirects" = 0;
        };

        #==> Extra <==#
        #extraModulePackages = with config.boot.kernelPackages; [];
        extraModprobeConfig = "
            options thinkpad_acpi fan_control=1
            ";
    };

    #==> SCX Sheduler <==#
    chaotic.scx = {
        enable = true;
        scheduler = "scx_rustland";
    };

}
