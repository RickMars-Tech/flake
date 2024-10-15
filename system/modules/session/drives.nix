{ ... }: {

#= Enable Trim Needed for SSD's
    services.fstrim = {
        enable = true;
        interval = "weekly";
    };

#= ZRAM
    zramSwap = {
        enable = true;
        priority = 10;
        memoryPercent = 50;
        algorithm = "zstd";
        swapDevices = 2;
    };

}
