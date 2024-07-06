{ config, pkgs, lib, ... }:

{

    programs.kitty = {
        enable = true;
        font = {
            name = "DaddyTimeMono Nerd Font";
            size = 12;
        };
        shellIntegration.enableFishIntegration = true;
        settings = {
            
            background_opacity = 0;

            cursor_shape = "beam";
            cursor_blink_interval = 0;
            cursor_stop_blinking_after = 15;

            scrollback_lines = 2000;
            scrollback_pager = "less +G -R";
            wheel_scroll_multiplier = 5;
            click_interval = 1;
            mouse_hide_wait = 0;

            select_by_word_characters = ":@-./_~?&=%+#";
            enabled_layouts = "*";

            remember_window_size = false;
            initial_window_width = 1200;
            initial_window_height = 900;

            repaint_delay = 10;
            input_delay = 2;
            sync_to_monitor = "no";
            wayland_enable_ime = "no";
            linux_display_server = "wayland";
            hide_window_decorations = "yes";
            wayland_titlebar_color = "background";
            macos_option_as_alt = "no";

            visual_bell_duration = 0;
            enable_audio_bell = "no";

            term = "kitty";

            window_border_width = 0;
            window_margin_width = 15;

        };
        keybindings = {
            # Clipboard
            "ctrl+shift+v" = "paste_from_clipboard";
            "ctrl+shift+s" = "paste_from_selection";
            "ctrl+shift+c" = "copy_to_clipboard";
            "shift+insert" = "paste_from_selection";

            # Tab management
            "ctrl+shift+right" = "next_tab";
            "ctrl+shift+left" = "previous_tab";
            "ctrl+shift+t" = "new_tab";
            "ctrl+shift+q" = "close_tab";
            "ctrl+shift+l" = "next_layout";
            "ctrl+shift+." = "move_tab_forward";
            "ctrl+shift+," = "move_tab_backward";

            # Miscellaneous
            "ctrl+shift+up" = "increase_font_size";
            "ctrl+shift+down" = "decrease_font_size";
            "ctrl+shift+backspace" = "restore_font_size";
        };
    };

}
