{
    description = "My NixOS Configuration";

    inputs = {

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nix-flatpak.url = "github:gmodena/nix-flatpak";

    };

    outputs = inputs@{
        home-manager,
        hyprland,
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

                nix-flatpak.nixosModules.nix-flatpak

                {
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
