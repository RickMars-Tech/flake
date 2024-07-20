{ config, pkgs, lib, ... }: {

#==> Kernel & Filesystem <==#
    boot.supportedFilesystems = [ "ntfs" ]; # Enable Support for Others FS
    boot.kernelPackages = pkgs.linuxPackages_latest; # Latest Linux Kernel

#==> Kernel Parameters <==#
    boot.kernelParams = [
        "amd_iommu=on"
        "amd_pstate.shared_mem=1"
        "amdgpu.noretry=0"
        "amdgpu.dc=1"
        "amdgpu.dpm=1"
        "amdgpu.ppfeaturemask=1"
        "amdgpu.exp_hw_support=1"
        "amdgpu.sq_display=0"
        "amdgpu.si_support=1"
        "amdgpu.cik_support=1"
        "radeon.si_support=0"
        "radeon.cik_support=0"
        "nvme_core.default_ps_max_latency_us=2000"
        "nvme_core.io_timeout=500"
        "nvme_core.use_host_mem=1"
        "transparent_hugepage=always"
        "mitigations=auto"
        "quiet"
        "splash"
        "loglevel=0"
        "nowatchdog"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_level=3"
    ];

#==> Kernel Modules <==#
    boot.kernelModules = [
        "amd-pstate-epp"
        "radeon"
        "tcp_bbr"
    ];
    boot.initrd.kernelModules = [
        "amdgpu"
        "amd_pmc"
        "zenpower"
        "radeon"
        "nvme"
        "nvme_core"
        "acer_wmi"
        "acer_wireless"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
        "snd-seq"
        "snd-rawmidi"
        "mq-deadline"
        "vmd"
    ];

#==> Kernel Runtime Parameters <==#
    boot.kernel.sysctl = {
        "vm.max_map_count" = 2147483642;
        "vm.swappiness" = 60;
        "vm.mmap_min_addr" = 65536;
        "vm.nr_overcommit_hugepages" = 5120;
        "vm.vfs_cache_pressure" = 50;
        "vm.overcommitMemory" = 0;
        "vm.dirty_bytes" = 16384;
        "vm.dirty_ratio" = 40;
        "vm.dirty_background_ratio" = 3;
        "vm.dirty_background_bytes" = 78643200;
        "vm.dirty_writeback_centisecs" = 1500;
        "vm.compaction_proactiveness" = 0;
        "vm.watermark_boost_factor" = 1;
        "vm.zone_reclaim_mode" = 0;
        "vm.page_lock_unfairness" = 1;
        "vm.page-cluster" = 0;
        "vm.page-replacement-algorithm" = "mglru";
        "vm.anon_min_ratio" = 15;
        "vm.clean_low_ratio" = 0;
        "vm.clean_min_ratio" = 15;
    # https://github.com/CachyOS/CachyOS-Settings/blob/master/etc/sysctl.d/99-cachyos-settings.conf
        "fs.file-max" = 2097152;
        "fs.inotify.max_user_watches" = 524288;
        "net.ipv4.conf.all.rp_filter" = 1;
        "net.ipv4.ping_group_range" = "0 65535";
        "net.ipv4.tcp_slow_start_after_idle" = 0;
    # https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/security_guide/sect-security_guide-server_security-disable-source-routing#sect-Security_Guide-Server_Security-Disable-Source-Routing
        "net.ipv4.conf.all.accept_source_route" = 0;
        "net.ipv4.conf.all.forwarding" = 0;
        "net.ipv6.conf.all.forwarding" = 0;
        "net.ipv4.conf.all.mc_forwarding" = 0;
        "net.ipv6.conf.all.mc_forwarding" = 0;
        "net.ipv4.conf.all.accept_redirects" = 0;
        "net.ipv6.conf.all.accept_redirects" = 0;
        "net.ipv4.conf.all.secure_redirects" = 0;
        "net.ipv4.conf.all.send_redirects" = 0;
    # https://enterprise-support.nvidia.com/s/article/linux-sysctl-tuning
    # and
    # https://documentation.suse.com/sbp/server-linux/html/SBP-performance-tuning/index.html#sec-kernel-tuning
        "net.ipv4.tcp_timestamps" = 0;
        "net.ipv4.tcp_sack" = 1;
        "net.core.netdev_max_backlog" = 250000;
        "net.core.netdev_budget " = 600;
        "net.core.somaxconn" = 4096;
        "net.core.busy_poll" = 0;
        "net.core.busy_read" = 0;
        "net.core.rmem_max" = 4194304;
        "net.core.wmem_max" = 4194304;
        "net.core.rmem_default" = 4194304;
        "net.core.wmem_default" = 4194304;
        "tcp_fastopen" = 1;
        "tcp_lowlatency" = 1;
        "tcp_sack" = 1;
        "ip_local_port_range" = "32768 60999";
        "tcp_max_syn_backlog" = 256;
        "tcp_tw_reuse" = 0;
        "tcp_tw_recycle" = 0;
        "tcp_timestamps" = 1;
        "tcp_syn_retries" = 6;
        "net.core.optmem_max" = 4194304;
        "net.ipv4.tcp_rmem" = "4096 87380 4194304";
        "net.ipv4.tcp_wmem" = "4096 65536 4194304";
        "net.ipv4.tcp_low_latency" = 1;
        "net.ipv4.tcp_adv_win_scale" = 1;
    };

#==> Extra <==#
    boot.extraModulePackages = with config.boot.kernelPackages; [
        zenpower
        v4l2loopback
    ];
    boot.extraModprobeConfig = "
        options kvm_amd nested=1 v4l2loopback devices=1 video_nr=1 card_label='OBS Cam' exclusive_caps=1
    ";

#==> Black List of Kernel Modules <==#
    boot.blacklistedKernelModules = [ "acpi_call" "k10temp" "iTCO_wdt" "sp5100_tco" ];
}
