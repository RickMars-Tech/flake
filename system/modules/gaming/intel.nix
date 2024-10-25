{ config, pkgs, lib, ... }: {

    #=> OpenGL, Drivers and more... 
    hardware = {
        graphics = {
            enable = true;
            extraPackages = with pkgs; [
                mesa.drivers
                libdrm
                intel-ocl # For Intel
                #intel-vaapi-driver # For Intel
                intel-compute-runtime # For Intel
                intel-media-driver # For Intel
                intel-graphics-compiler # For Intel
            ];
            enable32Bit = true;
            extraPackages32 = with pkgs.driversi686Linux; [
                mesa.drivers
                #glxinfo
                intel-vaapi-driver # For Intel
                intel-media-driver # For Intel
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
