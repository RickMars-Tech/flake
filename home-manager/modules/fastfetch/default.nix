{ config, pkgs, lib, ... }:

{

    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "nixos";
                padding = {
                    top = 1;
                };
            };
            display = {
                separator = "  ";
            };
            modules = [
                {
                    "type" = "title";
                    "format" = "{1}@{2}";
                }
                {
                    "type" = "custom"; # Operative System
                    "format" = "┌──────[ \u001b[32mOS\u001b[0m ]";
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
                    "key" = " ├─";
                }
                {
                    "type" = "uptime";
                    "key" = " ╰─󰅐";
                }

                {
                    "type" = "custom"; # HardwareStart
                    "format" = "├──────[ \u001b[32mHardware Information\u001b[0m ]";
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
                    "format" = "├─────[ \u001b[32mTerminal\u001b[0m ]";
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
                    "paddingLeft" = 1;
                    "symbol" = "circle";
                }

            ];
        };
    };

}
