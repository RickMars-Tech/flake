{ config, pkgs, lib, ... }: {

#= NetworkD
    systemd.network = {
        enable = true;
        networks = {
            "90-interfaces" = {
                matchConfig = { Name = "*"; };
                DHCP = "yes";
            };
            "80-wired" = {
                matchConfig = { Name = "enp*s*"; };
                DHCP= "yes";
            };
        };
        wait-online.timeout = 0;
    };

#= Host & Firewall
    networking = {
        hostName = "nixos"; # Define your hostname.
        /* networkmanager = {
            enable = true;
            wifi = {
                backend = "iwd"; #"wpa_supplicant";
            };
        };*/
        useDHCP = lib.mkForce false;
        wireless.iwd = {
            enable = true;
            settings = {
                Settings = {
                    AutoConnect = true;
                };
            };
        };
        firewall = {
            enable = true;
            pingLimit = "--limit 1/minute --limit-burst 5";
            allowedTCPPorts = [
                22
                53
                80
                443
                631
                3478
                3479
                8080
            ];
            allowedUDPPortRanges = [
                { from = 4000; to = 4007; }
                { from = 8000; to = 8010; }
            ];
        };
        enableIPv6 = false;
    };

#= Bluetooth
    hardware.bluetooth = {
        enable = true; # enables support for Bluetooth
        powerOnBoot = false; # powers up the default Bluetooth controller on boot
    };

#= Fail2Ban
    services.fail2ban = {
        enable = true;
        ignoreIP = [
            "9.9.9.11"
            "149.112.112.11"
            "2620:fe::11"
            "2620:fe::fe:11"
        ];
        maxretry = 5;
        bantime = "12h";
    };
}
