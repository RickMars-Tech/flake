{
    description = "My NixOS Configuration";

    inputs = {

        nix.url = "https://flakehub.com/f/DeterminateSystems/nix/2.0";
        nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz";
        nixos-hardware.url = "https://flakehub.com/f/NixOS/nixos-hardware/*.tar.gz";

        chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/*.tar.gz";
        
        hyprland.url = "https://flakehub.com/f/hyprwm/Hyprland/*.tar.gz";

        #cosmic.url = "github:lilyinstarlight/nixos-cosmic";

        nix-flatpak.url = "https://flakehub.com/f/gmodena/nix-flatpak/*.tar.gz";
        
        magic-nix-cache.url = "https://flakehub.com/f/DeterminateSystems/magic-nix-cache/*.tar.gz";

        home-manager = {
            url = "https://flakehub.com/f/nix-community/home-manager/0.1.0.tar.gz";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = inputs@{
        chaotic,
        #cosmic,
        nix-flatpak,
        home-manager,
        #lix,
        nix,
        nixpkgs,
        nixos-hardware,
        self,
        ...
    }: let 

        system = "x86_64-linux";
        #pkgs = nixpkgs.legacyPackages.${system};
        lib = nixpkgs.lib;
        username = "rick";
        name = "Rick";

    in {

        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            inherit lib;
            modules = [

                #==> Nix <==#
                ./system/configuration.nix
                #determinate.nixosModules.default
                #lix.nixosModules.default
                nix.nixosModules.default

                #==> Cosmic <==#
                #cosmic.nixosModules.default

                #==> Chaotic <==#
                chaotic.nixosModules.default

                #==> Flatpak <==#
                nix-flatpak.nixosModules.nix-flatpak

                #==> Thinkpad Module <==#
                nixos-hardware.nixosModules.lenovo-thinkpad-t420

                #==> Home-Manager <==#
                home-manager.nixosModules.home-manager
                {
                    nixpkgs.config.allowUnfree = true;
                    _module.args = { inherit inputs; };
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.rick = import ./home-manager/home.nix;
                    home-manager.extraSpecialArgs = {
                        inherit username;
                        inherit inputs;
                        inherit self;
                    };
                }
            ];
            specialArgs = {
                inherit inputs;
                inherit username;
                inherit name;
                inherit self;
            };
        };
    };
}
