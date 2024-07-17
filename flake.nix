{
    description = "My NixOS Configuration";

    inputs = {

        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        lix = {
            url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0.tar.gz";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        nix-flatpak.url = "github:gmodena/nix-flatpak";

    };

    outputs = inputs@{
        home-manager,
        hyprland,
        lix,
        nixpkgs,
        nix-flatpak,
        self,
        ...
    }: let 

        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
        username = "rick";
        name = "Rick";

    in {  

        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            inherit lib;
            modules = [

                ./system/configuration.nix
                
                home-manager.nixosModules.home-manager
                lix.nixosModules.default
                nix-flatpak.nixosModules.nix-flatpak

                {
                    _module.args = { inherit inputs; };
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.rick = import ./home-manager/home.nix;
                    home-manager.extraSpecialArgs = {
                        inherit inputs;
                        inherit self;
                        inherit username;
                    };
                }
            ];
            specialArgs = {
                inherit username;
                inherit name;
                inherit inputs;
                inherit self;
            };
        };
    };
}
