{ config, pkgs, lib, ...  }: {

 #= Power Management
    services.tlp = {
        enable = true;
        settings = {

        # Governor.
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "ondemand";

        # Performance Policy.
            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

        # CPU.
            CPU_DRIVER_OPMODE_ON_AC = "guided";
            CPU_DRIVER_OPMODE_ON_BAT = "guided";
            CPU_BOOST_ON_AC = 1;
            CPU_BOOST_ON_BAT = 0;
            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 30;

        # Runtime Power Management and ASPM.
            RUNTIME_PM_ON_AC = "auto";
            RUNTIME_PM_ON_BAT = "auto";

        # Battery.
            NATACPI_ENABLE = 1;

        # USB
            USB_AUTOSUSPEND = 1;
        };
    };
    services.power-profiles-daemon.enable = false;

  #= Powertop
    powerManagement = {
        enable = true;
    };

  #= UPower
    services.upower.enable = true;

  #= Thermal CPU Management
    services.thermald.enable = true; # Disable if your CPU isn't Supported

}
