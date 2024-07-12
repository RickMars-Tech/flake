{ config, pkgs, lib, ... }:

{

#==> Kernel <==#

  boot.kernelPackages = pkgs.linuxPackages_latest; # Latest Linux Kernel

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
      "mitigations=off"
      "quiet"
      "splash"
      "loglevel=0"
      "nowatchdog"
  ];

  boot.kernelModules = [ "amd-pstate-epp" "radeon" "tcp_bbr" ];
  boot.kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
      "vm.swappiness" = 50;
      "vm.mmap_min_addr" = 65536;
      "vm.nr_overcommit_hugepages" = 5120;
      "vm.vfs_cache_pressure" = 50;
      "vm.overcommitMemory" = 0;
      "vm.dirty_bytes" = 50331648;
      "vm.dirty_ratio" = 15;
      "vm.dirty_background_ratio" = 10;
      "vm.dirty_background_bytes" = 16777216;
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
      "net.core.netdev_max_backlog" = 16384;
      "net.core.somaxconn" = 8192;
      "net.ipv4.ping_group_range" = 65535;
      "net.ipv4.tcp_slow_start_after_idle" = 0;
    };

  boot.supportedFilesystems = [ "ntfs" ];
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
  boot.blacklistedKernelModules = [ "acpi_call" "k10temp" "iTCO_wdt" "sp5100_tco" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
      zenpower
      v4l2loopback
  ];
  boot.extraModprobeConfig = "
        options kvm_amd nested=1 v4l2loopback devices=1 video_nr=1 card_label='OBS Cam' exclusive_caps=1
  ";
}
