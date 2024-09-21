{ ... }: {

 #= Enable Trim Needed for SSD's
    services.fstrim = {
        enable = true;
        interval = "weekly";
    };

 #= ZRAM
    zramSwap = {
        enable = true;
        priority = 100;
        memoryPercent = 50;
        algorithm = "lz4";
        swapDevices = 2;
    };

}
