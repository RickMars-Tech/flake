{ config, pkgs, lib, ... }:

{
 #= Pipewire
  sound.enable = false;
  security.rtkit.enable = true; # Real-Time Priority to Processes.
  services.pipewire = {
    enable = true;
    audio.enable = true; # Use as primary sound server
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
        enable = true;
        configPackages = [
            (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-alsa-lowlatency.lua" ''
                alsa_monitor.rules = {
                    {
                        matches = {{{ "node.name", "matches", "alsa_output.*" }}};
                        apply_properties = {
                            ["audio.rate"] = "48000", -- for USB soundcards it should be twice your desired rate.
                            ["api.alsa.period-size"] = 2, -- defaults to 1024, tweak by trial-and-error.
                            ["api.alsa.disable-batch"] = true, -- generally, USB soundcards use the batch mode.
                            ["api.alsa.soft-mixer"] = true,
                            ["channelmix.normalize"] = true, -- making sure that the original 0 dB level is preserved.
                        },
                    },
                }
            '')
        ];
    };
    extraConfig = {
        pipewire = {
            "91-null-sinks" = {
                "context.objects" = [
                  {
                    # A default dummy driver. This handles nodes marked with the "node.always-driver"
                    # properyty when no other driver is currently active. JACK clients need this.
                    factory = "spa-node-factory";
                    args = {
                      "factory.name"     = "support.node.driver";
                      "node.name"        = "Dummy-Driver";
                      "priority.driver"  = 8000;
                    };
                  }
                  {
                    factory = "adapter";
                    args = {
                      "factory.name"     = "support.null-audio-sink";
                      "node.name"        = "Microphone-Proxy";
                      "node.description" = "Microphone";
                      "media.class"      = "Audio/Source/Virtual";
                      "audio.position"   = "MONO";
                    };
                  }
                  {
                    factory = "adapter";
                    args = {
                      "factory.name"     = "support.null-audio-sink";
                      "node.name"        = "Main-Output-Proxy";
                      "node.description" = "Main Output";
                      "media.class"      = "Audio/Sink";
                      "audio.position"   = "FL,FR";
                    };
                  }
                ];
            };
        };
    };
    socketActivation = true;
    systemWide = true;
    package = pkgs.pipewire;
  };
  hardware.pulseaudio.enable = false;
}
