{ pkgs, lib, inputs, ... }: {

#= Fenix (Rust Toolchain & Rust-Analyzer Nightly).
    nixpkgs.overlays = [ inputs.fenix.overlays.default ];

#= Allow unfree packages
    nixpkgs.config.allowUnfree = true;

#= Permitted Insecure Packages
    nixpkgs.config.permittedInsecurePackages = [ ];

#=> Packages Installed in System Profile.
    environment.systemPackages = with pkgs; [
    #= Gnome
        /*
        gnome-extension-manager
        gnomeExtensions.appindicator
        gnomeExtensions.dash-to-dock
        gnomeExtensions.blur-my-shell
        gnomeExtensions.gamemode-indicator-in-system-settings
        gnomeExtensions.vitals
        gnomeExtensions.xwayland-indicator
        gnome.gnome-tweaks
        gnome.gnome-calculator
        gnome.dconf-editor
        gnome.eog
        */
        nautilus
    #= Main
        alsa-lib
        alsaLib
        alsa-plugins
        alsa-utils
        libsForQt5.ark
        geogebra6
        webcord
        electron
        #jq
        qt5.qtwayland
        qt6.qtwayland
        usbutils
        wget
        libreoffice
        #yarn
    #= FOSS Electronics Design Automation suite
        kicad
    #= Clamav Anti-Virus
        clamav
        clamtk
    #= Blender
        blender
    #= Code Editor
        #vscodium-fhs
        (vscode-with-extensions.override {
            vscode = vscodium-fhs;
            vscodeExtensions = with vscode-extensions; [
                rust-lang.rust-analyzer
                supermaven.supermaven
                bbenoist.nix
                ms-python.python
                ms-python.debugpy
                ms-python.pylint
            ];
        })
        #zed-editor
    #= Game Engine
        godot_4
    #= Rust
        (fenix.complete.withComponents [
            "cargo"
            "clippy"
            "rust-src"
            "rustc"
            "rustfmt"
        ])
        rust-analyzer-nightly
    #= C/C++
        boost
        cmake
        gccgo
        glib
        glibc
        glibmm
        libgcc
        SDL2
        SDL2_image
        SDL2_ttf
    #= Python
        (python312.withPackages (ps: with ps; [
            anyqt
            pyqtdarktheme
            qtawesome
            pyqtgraph
            pyqt6
            pyqt6-sip
            py
            pipx
            pydevd
            pylint
            pyside6
            pygame
        ]))
        #jetbrains.pycharm-community-src # PyCharm
        #libsForQt5.qt5.qttools
        #libsForQt5.full
    #= XDG
        xdg-utils-cxx
        xdg-launch
    #= Cli Utilities
        any-nix-shell
        babelfish
        bat
        eza
        fzf
        fastfetch
        #git
        gitoxide
        htop-vim
        lynx
        macchanger
        ripgrep
        skim
        uutils-coreutils-noprefix
        zfxtop
    #= Fish Plugins
        #fishPlugins.done
        #fishPlugins.fzf-fish
        #fishPlugins.forgit
        #fishPlugins.hydro
    #= Archives
        imagemagick
        zip
        unzip
        gnutar
        #rarcrack
        rar
        unrar-free
    #= Drives utilities
        gnome-disk-utility # Disk Manager.
        baobab # Gui app to analyse disk usage.
        ventoy # Flash OS images for Linux and anothers Systems.
        #woeusb # Flash OS images for Windows.
    #= Flatpak
        libportal
        libportal-gtk3
        libportal-gtk4
        libportal-qt5
    #= Graph manager dedicated for PipeWire
        pavucontrol # Pulseaudio Volume Control
        pwvucontrol
    #= Appimages
        #appimagekit
        appimage-run
    #= Torrent
        qbittorrent
    #= Image Editors
        #krita
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
    #= Wine
        bottles
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
