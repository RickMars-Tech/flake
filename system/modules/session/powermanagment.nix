{ ...  }: {

#= TLP (Advanced Power Management for Linux).
    services.tlp = {
        enable = true;
        settings = {

        # Governor.
            CPU_SCALING_GOVERNOR_ON_AC = "schedutil"; #"performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave"; #"schedutil";

        # Performance Policy.
            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # CPU.
            CPU_DRIVER_OPMODE_ON_AC = "active";
            CPU_DRIVER_OPMODE_ON_BAT = "passive";
            CPU_BOOST_ON_AC = 1;
            CPU_BOOST_ON_BAT = 0;
            CPU_HWP_DYN_BOOST_ON_AC=1;
            CPU_HWP_DYN_BOOST_ON_BAT=0;
            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 70;

        # GPU
            INTEL_GPU_MIN_FREQ_ON_AC = 650;
            INTEL_GPU_MIN_FREQ_ON_BAT = 650;
            INTEL_GPU_MAX_FREQ_ON_AC = 1300;
            INTEL_GPU_MAX_FREQ_ON_BAT = 1000;
            INTEL_GPU_BOOST_FREQ_ON_AC = 1300;
            INTEL_GPU_BOOST_FREQ_ON_BAT = 1000;
        
        # Runtime Power Management and ASPM.
            RUNTIME_PM_ON_AC = "auto";
            RUNTIME_PM_ON_BAT = "auto";

        # Battery.
            START_CHARGE_THRESH_BAT0 = 95;
            STOP_CHARGE_THRESH_BAT0 = 100;

        # USB
            #USB_AUTOSUSPEND = 0;

        # ACPI
            NATACPI_ENABLE = 1;
            TPACPI_ENABLE = 1;
            TPSMAPI_ENABLE = 1;

        # NMI_Watchdog
            NMI_WATCHDOG = 0;
        };
    };
    services.power-profiles-daemon.enable = false;

    services.thermald = {
        enable = true;
    };

}
