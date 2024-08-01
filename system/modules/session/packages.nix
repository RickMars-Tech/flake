{ config, pkgs, lib, input, ... }: {

 #= Config Of General Packages

 #= Allow unfree packages
    nixpkgs.config.allowUnfree = true;

 #= Permitted Insecure Packages
    nixpkgs.config.permittedInsecurePackages = [
        "electron-19.1.9"
        "openjdk-19-ga"
        "temurin-bin-19.0.2"
    ];

 #=> Packages Installed in System Profile.
    environment.systemPackages = with pkgs; [
 #= Gnome
        #gnome-extension-manager
        #gnomeExtensions.appindicator
        #gnomeExtensions.dash-to-dock
        #gnomeExtensions.blur-my-shell
        #gnomeExtensions.gamemode-indicator-in-system-settings
        #gnomeExtensions.vitals
        #gnomeExtensions.xwayland-indicator
        #gnome.gnome-tweaks
        #gnome.gnome-calculator
        #gnome.dconf-editor
        #gnome.eog
        nautilus
 #= Main
        alsa-plugins
        alsa-utils
        libsForQt5.ark
        geogebra6
        webcord
        electron
        jq
        qt5.qtwayland
        qt6.qtwayland
        usbutils
        wget
        libreoffice
        yarn
 #= Clamav Anti-Virus
        clamav
        clamtk
 #= Blender
        blender-hip
 #= C/C++
        boost
        cmake
        glibc
        glibmm
        libgcc
        SDL2
 #= Python
        python3
        python312Packages.pipx # Install and Run Python Applications in Isolated Environments
        jetbrains.pycharm-professional # PyCharm
        libsForQt5.qt5.qttools
        libsForQt5.full
 #= XDG
        xdg-utils-cxx
        xdg-launch
 #= Cli Utilities
        babelfish
        bat
        eza
        fzf
        fastfetch
        git
        htop-vim
        macchanger
        ripgrep
        skim
        zfxtop
    # Fish Plugins
        fishPlugins.done
        fishPlugins.fzf-fish
        fishPlugins.forgit
        fishPlugins.hydro
 #= Archives
        imagemagick
        zip
        unzip
        gnutar
        rarcrack
        rar
        unrar-free
 #= Rust
        cargo # PackageManager for rust
        rustup # Rust toolchain installer
 #= Drives utilities
        gnome-disk-utility # Disk Manager.
        baobab # Gui app to analyse disk usage.
        ventoy # Flash OS images for Linux and anothers Systems.
        woeusb # Flash OS images for Windows.
 #= Flatpak
        libportal
        libportal-gtk3
        libportal-gtk4
        libportal-qt5
 #= Graph manager dedicated for PipeWire
        pavucontrol # Pulseaudio Volume Control
        pwvucontrol
 #= Appimages
        appimagekit
        appimage-run
 #= TOR
        #obfs4
        #tor-browser
 #= Image Editors
        krita
        gimp
 #= Video/Audio Tools
        shotcut
 #= Video Recorder
        (pkgs.wrapOBS {
            plugins = with pkgs.obs-studio-plugins; [
                wlrobs
                obs-backgroundremoval
                obs-pipewire-audio-capture
                obs-vkcapture
                obs-gstreamer
                obs-vaapi
            ];
        })
 #= GStreamer and codecs
    # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
        gst_all_1.gstreamermm # C++ interface for GStreamer
    # Common plugins like "filesrc" to combine within e.g. gst-launch
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-rs # Written in Rust
    # ViPER FX core wrapper plug-in for GStreamer1
        gst_all_1.gst-plugins-viperfx
    # Specialized plugins separated by quality
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
    # Plugins to reuse ffmpeg to play almost every video format
        gst_all_1.gst-libav
    # Support the Video Audio (Hardware) Acceleration API
        gst_all_1.gst-vaapi
    # Library for creation of audio/video non-linear editors
        gst_all_1.gst-editing-services
    # H.264 encoder/decoder plugin for mediastreamer2
        mediastreamer-openh264
    # H264/AVC 
        x264 
    # H.265/HEVC
        x265
    # WebM VP8/VP9 codec SDK
        libvpx
    # Vorbis audio compression
        libvorbis
    # Open, royalty-free, highly versatile audio codec
        libopus
    # MPEG
        lame
    # PNG
        libpng
    # JPEG
        libjpeg
    # FFMPEG
        ffmpeg-full
        ffmpeg-headless
        ffmpegthumbnailer
 #= Media Player
        (pkgs.mpv-unwrapped.wrapper {
            mpv = pkgs.mpv-unwrapped.override {
                ffmpeg = pkgs.ffmpeg-full;
                waylandSupport = true;
            };
        })
    ];

 #= Java =#
    programs.java = {
        enable = true;
        package = pkgs.jdk;
        binfmt = true;
    };

#==> Appimages <==#
    programs.appimage = {
        enable = true;
        binfmt = true;
    };
}
