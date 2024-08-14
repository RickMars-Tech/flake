{ config, pkgs, lib, ... }: {

    boot = lib.mkIf config.services.tlp.enable {
        kernelModules = [ "acpi_call" ];
        extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
    };

    services.thinkfan = {
        enable = true;
    };

    services.throttled = {
        enable = true;
        extraConfig = "";
    };

}
