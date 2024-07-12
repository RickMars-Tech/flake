{ config, pkgs, lib, ... }:

{

    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "nixos";
                padding = {
                    right = 1; #top = 1;
                };
            };
            display = {
                binaryPrefix = "si";
                separator = "  ";
            };
            modules = [
                {
                    "type" = "title";
                    "format" = "{1}@{2}";
                }
                {
                    "type" = "custom"; # Operative System
                    "format" = "┌──────[ OS ]";
                }
                {
                    "type" = "os";
                    "key" = " ╭─"; # Just get your distro's logo from nerdfonts.com
                }
                {
                    "type" = "kernel";
                    "key" = " ├─";
                    "format" = "{1} {2}";
                }
                {
                    "type" = "packages";
                    "key" = " ├─󰏖";
                }
                {
                    "type" = "de";
                    "key" = " ├─";
                }
                {
                    "type" = "wm";
                    "key" = " ╰─";
                }

                {
                    "type" = "custom"; # HardwareStart
                    "format" = "├──────[ Hardware Information ]";
                }
                {
                    "type" = "cpu";
                    "key" = " ╭─";
                }
                {
                    "type" = "gpu";
                    "key" = " ├─";
                }
                {
                    "type" = "disk";
                    "key" = " ├─";
                }
                {
                    "type" = "memory";
                    "key" = " ├─󰑭";
                }
                {
                    "type" = "swap";
                    "key" = " ├─󰓡";
                }
                {
                    "type" = "display";
                    "key" = " ├─󰍹";
                }
                {
                    "type" = "brightness";
                    "key" = " ├─󰃠";
                }
                {
                    "type" = "battery";
                    "key" = " ├─";
                }
                {
                    "type" = "poweradapter";
                    "key" = " ├─";
                }
                {
                    "type" = "bluetooth";
                    "key" = " ├─";
                }
                {
                    "type" = "sound";
                    "key" = " ╰─";
                }

                {
                    "type" = "custom"; #Terminal
                    "format" = "├─────[ Terminal ]";
                }
                {
                    "type" = "shell";
                    "key" = " ╭─";
                }
                {
                    "type" = "terminal";
                    "key" = " ╰─";
                }

                {
                    "type" = "custom"; # InformationEnd
                    "format" = "└──────────────────────────────────────────────┘";
                }
                {
                    "type" = "colors";
                    "paddingLeft" = 2;
                    "symbol" = "circle";
                }

            ];
        };
    };

}
