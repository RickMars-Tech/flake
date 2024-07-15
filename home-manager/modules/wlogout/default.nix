{ config, pkgs, ... }: {

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "lock";
        action = "${pkgs.hyprlock}/bin/hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "loginctl kill-session $XDG_SESSION_ID";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "suspend";
        action = "${pkgs.hyprlock}/bin/hyprlock";
        text = "Suspend";
        keybind = "u";
      }

    ];

    style = ''
        *{
            font-family: "DaddyTimeMono";
            background-image: none;
            transition: 15ms;
        }

        @define-color bar-bg rgba(0, 0, 0, 0);

        @define-color text-color-m #FFFFFF;
        @define-color text-color-h #000000;
        @define-color text-color-f #000000;

        @define-color main-bg rgba( 14, 14, 23, 0.70);
        @define-color main-fg rgba(205, 214, 244, 0.80);

        @define-color wb-act-bg rgba(166, 173, 200, 0.80);
        @define-color wb-act-fg rgba(49, 50, 68, 0.80);

        @define-color wb-hvr-bg rgba(245, 194, 231, 0.80);
        @define-color wb-hvr-fg rgba(49, 50, 68, 0.80);

        window {
            background-color: @main-bg;
        }

        button {
            color: @text-color-m;
            background-color: transparent;
            border-style: none;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 35%;
            border-radius:30px;
            font-size: 18px;
            margin: 182px 5px;
            text-shadow: 0px 0px;
            box-shadow: 0px 0px;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
        }

        button:focus {
            color: @text-color-f;
            background-color: @wb-act-bg;
            background-size: 40%;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
        }

        button:hover {
            color: @text-color-h;
            background-color: @wb-hvr-bg;
            background-size: 50%;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
        }



        /* 
        ----------------------------------------------------- 
        Buttons
        -----------------------------------------------------
        */

        #lock,#logout,#shutdown,#reboot,#hibernate,#suspend {
            margin: 10px;
        }

        #lock {
            background-image: image(url("icons/lock_black.png"));
        }
        #lock:focus,
        #lock:hover {
            background-image: image(url("icons/lock_white.png"));
        }

        #logout {
            background-image: image(url("icons/logout_black.png"));
        }
        #logout:focus,
        #logout:hover {
            background-image: image(url("icons/logout_white.png"));
        }

        #shutdown {
            background-image: image(url("icons/shutdown_black.png"));
        }
        #shutdown:focus,
        #shutdown:hover {
            background-image: image(url("icons/shutdown_white.png"));
        }

        #reboot {
            background-image: image(url("icons/reboot_black.png"));
        }
        #reboot:focus,
        #reboot:hover {
            background-image: image(url("icons/reboot_white.png"));
        }

        #hibernate {
            background-image: image(url("icons/hibernate_black.png"));
        }
        #hibernate:focus,
        #hibernate:hover {
            background-image: image(url("icons/hibernate_white.png"));
        }

        #suspend {
            background-image: image(url("icons/suspend_black.png"));
        }
        #suspend:focus,
        #suspend:hover {
            background-image: image(url("icons/suspend_white.png"));
        }
    '';
  };

  xdg.configFile."wlogout/icons" = {
    recursive = true;
    source = ./icons;
  };

}
