{ config, pkgs, lib, inputs, ... }: {

#=> OpenGL, Drivers and more... 
    hardware.graphics.enable = true;
    hardware.graphics.extraPackages = with pkgs; [
        mesa.drivers
        libdrm
        vdpauinfo
        libva-vdpau-driver
        libvdpau-va-gl
        #rocmPackages.clr.icd # OpenCL
    ];
    hardware.graphics.enable32Bit = true;
    hardware.graphics.extraPackages32 = with pkgs.driversi686Linux; [
        mesa.drivers
        glxinfo
        vdpauinfo
        libva-vdpau-driver
        libvdpau-va-gl
    ];

#= LACT (Linux AMDGPU Controller).
    environment.systemPackages = with pkgs; [
        lact
    ];

#= MSR.
    hardware.cpu.x86.msr.enable = true;

#=> Firmware (mostly for battery life).
    hardware.cpu.amd.updateMicrocode = lib.mkDefault true; # Update Microcode
    hardware.enableAllFirmware = lib.mkDefault true;
    hardware.enableRedistributableFirmware = lib.mkDefault true; # Lemme update my CPU Microcode, alr?!
    hardware.firmware = with pkgs; [firmwareLinuxNonfree];

  # Use https://github.com/fwupd/fwupd
  # fwupdmgr get-updates # list updates
  # fwupdmgr update # performs firmware update
    services.fwupd.enable = true;

}
