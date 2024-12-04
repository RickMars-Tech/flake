{ pkgs, lib, ... }: {

    #=> OpenGL, Drivers and more... 
    hardware = {
        graphics = {
            enable = true;
            extraPackages = with pkgs; [
                mesa.drivers
                libdrm
                intel-media-sdk
                intel-ocl
                intel-vaapi-driver
                intel-compute-runtime
                intel-media-driver
                intel-graphics-compiler
            ];
            enable32Bit = true;
            extraPackages32 = with pkgs.driversi686Linux; [
                mesa.drivers
                #glxinfo
                intel-vaapi-driver
                intel-media-driver
            ];
        };
        intel-gpu-tools.enable = true;
        cpu = {
            x86.msr.enable = true; #= MSR.
            intel.updateMicrocode = true;
        };
        enableAllFirmware = lib.mkDefault true; # Enable Properitary Firmware
        enableRedistributableFirmware = lib.mkDefault true; # Lemme update my CPU Microcode, alr?!
        firmware = with pkgs; [
            linux-firmware
        ];
    };

}
