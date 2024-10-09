{ pkgs, lib, ... }:  {
    
    nixpkgs = {
        overlays = [
            (self: super: {
                linuxWMuQSS = pkgs.linuxPackagesFor (pkgs.linux_latest.kernel.override {
                    structuredExtraConfig = with lib.kernel; {
                        CONFIG_CC_VERSION_TEXT = "clang version 18.1.8";
                        CONFIG_GCC_VERSION = "0";
                        SCHED_MUQSS = yes;
                    };
                    ignoreConfigErrors = true;
                });
            })
        ];
    };
}
