{ ... }: {

 #=> WAYDROID <=#
    virtualisation.waydroid.enable = false;

    #environment.systemPackages = with pkgs; [ waydroid ];

 #=> Enable AMD SEV (For Memory Security).
    hardware.cpu.amd.sev.enable = true;
    hardware.cpu.amd.sevGuest.enable = true;
}
