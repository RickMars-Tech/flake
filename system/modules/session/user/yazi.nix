{ pkgs, ... }: {

  # Yazi
    programs.yazi = {
        enable = true;
        settings.yazi = {
            manager = {
                sort_by = "natural";
                show_hidden = true;
                show_symlink = true;
            };
            preview = {
                image_filter = "lanczos3";
                image_quality = 60;
                max_width = 600;
                max_height = 900;
                ueberzug_scale = 1;
                ueberzug_offset = [0 0 0 0];
            };
            tasks = {
                micro_workers = 5;
                macro_workers = 10;
                bizarre_retry = 5;
            };
            keymap = "la-latin1";
        };
        package = pkgs.yazi;
    };
}
