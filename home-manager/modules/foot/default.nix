{ config, pkgs, lib, ... }:

{

    programs.foot = {
        enable = true;
        settings = {
            main = {
                font = "DaddyTimeMono Nerd Font:size=12";
            };

            url.osc8-underline = "always";

            cursor = {
                style = "beam";
                unfocused-style = "unchanged";
                blink = "yes";
            };

            mouse = {
                hide-when-typing = "yes";
            };

            key-bindings = {
                scrollback-up-page = "Control+Shift+Page_Up";
                scrollback-down-page = "Control+Shift+Page_Down";
                scrollback-up-line = "Control+Shift+Up";
                scrollback-down-line = "Control+Shift+Down";
            };

            # Custom Theme
            colors = {
                alpha = "0.9";
                
                background = "0E0E17";
                foreground = "c4c5e6";

                regular0 = "9c9db8";
                bright0 = "9c9db8";

                regular1 = "94594B";
                bright1 = "94594B";

                regular2 = "C69E5B";
                bright2 = "C69E5B";

                regular3 = "5F5B9D";
                bright3 = "5F5B9D";

                regular4 = "445CAD";
                bright4 = "445CAD";

                regular5 = "8D6FAE";
                bright5 = "8D6FAE";

                regular6 = "5E95DD";
                bright6 = "5E95DD";

                regular7 = "c4c5e6";
                bright7 = "c4c5e6";

                selection-background = "0E0E17";
                selection-foreground = "0B0C17";

                search-box-no-match = "11111b f38ba8";
                search-box-match = "cdd6f4 313244";

                jump-labels = "11111b fab387";
                urls = "89b4fa";
            };

        };
    };

}
