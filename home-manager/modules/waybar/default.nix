{ config, pkgs, lib, ... }: {

    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top"; #"bottom";
                exclusive = true;

                 "modules-left" = [ "custom/nix" "hyprland/workspaces" "hyprland/window" ];
                 "modules-center" = [ "clock" ];
                 "modules-right" = [ "gamemode" "tray" "cpu" "memory" "battery" "temperature" "backlight" "wireplumber" "network" ];

                 ##--------------------------
                 ## Hyprland Workspaces
                 ##--------------------------
                 "hyprland/workspaces" = {
                     "disable-scroll" = false;
                     "all-outputs" = true;
                     "format" = "{icon}";
                     "on-scroll-up" = "hyprctl dispatch workspace e+1";
                     "on-scroll-down" = "hyprctl dispatch workspace e-1";
                     "format-icons" = {
                        "1" = "";
                        "2" = "󱎓";
                        "3" = "󰈹";
                        "4" = "󰙯";
                        "5" = "";
                        "6" = "󰹉";
                        "7" = "󰈔";
                        "8" = "󰋊";
                        "9" = "";
                        "10" = "";
                    };
	                "persistent-workspaces" = {
                        "1" = [];
                        "2" = [];
                        "3" = [];
                        "4" = [];
                        "5" = [];
                        "6" = [];
                    };
                };

                "custom/nix" = {
                    "format" = "";
                };

                ##--------------------------
                ## Wireplumber
                ##--------------------------
                "wireplumber" = {
                    "format" = "{volume}% {icon}";
                    "format-icons" = [ "" "" ""];
                    "on-click" = "wpctl";
                };

                ##--------------------------
                ## Brightnessctl
                ##--------------------------
                "backlight" = {
                    "format" = "{percent}% {icon}";
                    "format-icons" = ["󰃛" "󰃜" "󰃝" "󰃞" "󰃟" "󰃠"];
                    "on-click" = "brightnessctl";
                };

                ##--------------------------
                ## Gamemode
                ##--------------------------
                "gamemode" = {
                    "format" = "{glyph}";
                    "format-alt" = "{glyph} {count}";
                    "glyph" = "";
                    "hide-not-running" = true;
                    "use-icon" = true;
                    "icon" = "nf-fa-gamepad";
                    "icon-spacing" = 4;
                    "icon-size" = 20;
                };

                ##--------------------------
                ## Tray
                ##--------------------------
                "tray" = {
                    "icon-size" = 20;
                    "spacing" = 10;
                };

                ##--------------------------
                ## CPU
                ##--------------------------
                "cpu" = {
                    "interval" = 5;
                    "tooltip" = false;
                    "format" = " {usage}%";
                    "format-alt" = " {load}";
                    "states" = {
                        "warning" = 70;
                        "critical" = 90;
                    };
                };

                ##--------------------------
                ## RAM
                ##--------------------------
                "memory" = {
                    "interval" = 5;
                    "format" = "  {used:0.1f}G/{total:0.1f}G";
                    "states" = {
                        "warning" = 70;
                        "critical" = 90;
                    };
                    "tooltip" = false;
                };

                ##--------------------------
                ## Network
                ##--------------------------
                "network" = {
                    "interval" = 5;
                    "format-wifi" = "󰤨  Connected";
                    "format-ethernet" = "󰈀 {essid}";
                    "format-disconnected" = "󰤮";
                    "format-alt" = "󰈀 {essid}";
                    "tooltip" = false;
                };

                "bluetooth" = {
                    "format" = " {status}";
                    "format-connected" = " {device_alias}";
                    "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
                    "format-device-preference" = [ "device1" "device2" ]; # preference list deciding the displayed device
                    "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
                    "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
	                "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
                    "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
                };

                ##--------------------------
                ## Clock
                ##--------------------------
                "clock" = {
                    "format" = "  {:%I:%M}";
                    "format-alt" = " {:%d/%m/%y}";
                    "tooltip" = "true";
                    "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                };

                ##--------------------------
                ## Temperature
                ##--------------------------
                "temperature" = {
                    "critical-threshold" = 90;
                    "interval" = 5;
                    "format" = "{icon} {temperatureC}°";
                    "format-icons" = [
                        ""
                        ""
                        ""
                        ""
                        ""
                    ];
                    "tooltip" = false;
                };

                ##--------------------------
                ## Battery
                ##--------------------------
                "battery" = {
                    "interval" = 10;
                    "states" = {
                        "warning" = 30;
                        "critical" = 15;
                    };
                    "format-time" = "{H}:{M:02}";
                    "format" = "{icon}  {capacity}%";
                    "format-charging" = "󰂄 {capacity}%";
                    "format-charging-full" = " {capacity}%";
                    "format-full" = "{icon} {capacity}%";
                    "format-alt" = "{icon} ({time}Hrs)";
                    "format-icons" = [
                        ""
                        ""
                        ""
                        ""
                        ""
                    ];
                    "tooltip" = false;
                };
            };
        };
    };

    xdg.configFile."waybar/style.css".source = ./style.css;

}
