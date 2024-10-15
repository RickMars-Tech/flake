{ ... }: {

#= General
     virtualisation = {
         libvirtd.enable = true;
         waydroid.enable = false;
    };
    #environment.systemPackages = with pkgs; [ waydroid ];

#=> Virt-Manager
    programs.virt-manager.enable = true;

#=> Enable AMD SEV (For Memory Security).
    hardware.cpu.amd.sev.enable = true;
    hardware.cpu.amd.sevGuest.enable = true;
}
