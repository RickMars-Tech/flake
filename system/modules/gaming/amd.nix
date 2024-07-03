{ config, pkgs, lib, inputs, ... }:

{

#=> OpenGL, Drivers and more... 
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
        mesa.drivers
        libdrm
        vaapiVdpau
        vdpauinfo
        libvdpau
        libvdpau-va-gl
        rocmPackages.clr.icd # OpenCL
  ];
  hardware.graphics.enable32Bit = true;
  hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
        mesa.drivers
        glxinfo
        vaapiVdpau
        vdpauinfo
        libvdpau-va-gl
  ];

#= LACT (Linux AMDGPU Controller).
  environment.systemPackages = with pkgs; [
      lact
  ];

#= Update Microcode.
  hardware.cpu.amd.updateMicrocode = lib.mkDefault true;

#= MSR.
  hardware.cpu.x86.msr.enable = true;

#=> Firmware.
  hardware.enableAllFirmware = lib.mkDefault true;
  hardware.enableRedistributableFirmware = lib.mkDefault true; # Lemme update my CPU Microcode, alr?!

  services.fwupd.enable = true;

}
