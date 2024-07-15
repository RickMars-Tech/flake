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
            (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
                bluez_monitor.properties = {
                    ["bluez5.enable-sbc-xq"] = true,
                    ["bluez5.enable-msbc"] = true,
                    ["bluez5.enable-hw-volume"] = true,
                    ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
                }
            '')
            (pkgs.writeTextFile {
                name = "wireplumber-audio-fixes";
                text = ''
                    rule = {
                        matches = {{{"device.name", "equals", "alsa_card.pci-0000_03_00.6.pro-output-0"}}};

                        apply_properties = {
                            ["audio.format"] = "U32BE";
                            ["node.disabled"] = false,
                            ["channelmix.normalize"] = true,
                            ["channelmix.mix-lfe"] = true,
                            ["channelmix.disable"] = false,
                            ["monitor.channel-volumes"] = false,
                            ["device.disabled"] = false,
                            ["node.pause-on-idle"] = false,
                            ["node.disabled"] = false,
                            ["resample.quality"] = 4,
                            ["resample.disable"] = false,
                        },
                    }

                   table.insert(alsa_monitor.rules,rule)
                '';
                destination = "/share/wireplumber/main.lua.d/51-disable-audio-fixes.lua";
            })
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
            "92-low-latency" = {
                context.properties = {
                    default.clock.rate = 48000;
                    default.clock.quantum = 32;
                    default.clock.min-quantum = 32;
                    default.clock.max-quantum = 32;
                };
            };
        };
        pipewire-pulse."92-low-latency" = {
            context.modules = [
                {
                    name = "libpipewire-module-protocol-pulse";
                    args = {
                        pulse.min.req = "32/48000";
                        pulse.default.req = "32/48000";
                        pulse.max.req = "32/48000";
                        pulse.min.quantum = "32/48000";
                        pulse.max.quantum = "32/48000";
                    };
                }
            ];
            stream.properties = {
                node.latency = "32/48000";
                resample.quality = 1;
            };
        };
    };
    socketActivation = true;
    systemWide = true;
    package = pkgs.pipewire;
  };
  hardware.pulseaudio.enable = false;
}
