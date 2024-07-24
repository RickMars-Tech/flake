{ config, pkgs, lib, inputs, ... }: {

#=> OpenGL, Drivers and more... 
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            mesa.drivers
            libdrm
            vdpauinfo
            libva-vdpau-driver
            libvdpau-va-gl
        ];
        enable32Bit = true;
        extraPackages32 = with pkgs.driversi686Linux; [
            mesa.drivers
            glxinfo
            vdpauinfo
            libva-vdpau-driver
            libvdpau-va-gl
        ];
    };

#=> Hardware & Firmware
    hardware = {
        cpu = {
            x86.msr.enable = true; #= MSR.
            amd.updateMicrocode = true; # Update Microcode
        };
        enableAllFirmware = true;
        enableRedistributableFirmware = lib.mkDefault true; # Lemme update my CPU Microcode, alr?!
        firmware = with pkgs; [ linux-firmware ];
    };

}
