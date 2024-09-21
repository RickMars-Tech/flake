{ pkgs, ... }: {

    environment = {
        extraInit = "~/.cargo/bin";
        pathsToLink = [ "/share/X11" "/libexec" "/share/nix-ld" ];
        sessionVariables = {
        #=> Default's
            EDITOR = "nvim";
            BROWSER = "firefox";
            TERMINAL = "kitty";
        #=> Enable touch-scrolling in Mozilla software
            MOZ_USE_XINPUT2 = "1";
        #=> JAVA
            _JAVA_AWT_WM_NONREPARENTING = "1";
        #=> Python
            PYGAME_DETECT_AVX2 = "1";
        #=> RADEON
            #AMD_VULKAN_ICD = "RADV"; # Force radv
            #AMDVLK_ENABLE_DEVELOPING_EXT = "all";
            RADV_PERFTEST = "aco"; # Force aco
        #=> PKG_CONFIG
            PKG_CONFIG_PATH = "${pkgs.alsa-lib}/lib/pkgconfig:${pkgs.pkg-config}/lib/pkgconfig";
        #=> Load Shared Objects Immediately
            LD_BIND_NOW = "1";
        #=> SDL2
            LIBRARY_PATH = "${pkgs.SDL2}/lib";
            C_INCLUDE_PATH = "${pkgs.SDL2}/include";
        #=> Steam
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
        #=> Wayland
            MOZ_ENABLE_WAYLAND = "1";
            NIXOS_OZONE_WL = "1";
            OZONE_PLATFORM = "wayland";
            QT_QPA_PLATFORM = "wayland";
            SDL_VIDEODRIVER = "wayland";
            #WLR_DRM_NO_ATOMIC = "1";
            #WLR_NO_HARDWARE_CURSORS = "1";
            #WLR_RENDERER_ALLOW_SOFTWARE = "1";
            #WLR_RENDERER = "vulkan";
        #=> Flatpak
            FLATPAK_GL_DRIVERS = "mesa-git";
        #=> Polkit
            POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        };
    };
}
