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
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # CPU.
            CPU_DRIVER_OPMODE_ON_AC = "active";
            CPU_DRIVER_OPMODE_ON_BAT = "active";
            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 30;

        # AMD GPU.
            RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
            RADEON_DPM_PERF_LEVEL_ON_BAT = "auto";
            RADEON_DPM_STATE_ON_AC = "performance";
            RADEON_DPM_STATE_ON_BAT = "battery";
            RADEON_POWER_PROFILE_ON_AC = "default";
            RADEON_POWER_PROFILE_ON_BAT = "default";

        # Runtime Power Management and ASPM.
            RUNTIME_PM_ON_AC = "auto";
            RUNTIME_PM_ON_BAT = "auto";

        # Battery.
            NATACPI_ENABLE = 1;

        # USB
            USB_AUTOSUSPEND = 1;

            TLP_DEFAULT_MODE = "BAT";
            TLP_PERSISTENT_DEFAULT = 1;
        };
    };
    services.power-profiles-daemon.enable = false;

  #= Powertop
    powerManagement = {
        enable = true;
        powertop.enable = true;
    };

  #= UPower
    services.upower.enable = true;

  #= Thermal CPU Management
    services.thermald.enable = true; # Disable if your CPU isn't Supported

}
