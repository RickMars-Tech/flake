{
    description = "My NixOS Configuration";

    inputs = {

        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

        lix = {
            url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0.tar.gz";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-ld = {
            url = "github:Mic92/nix-ld";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        /*fenix = {
            url = "github:nix-community/fenix";
            inputs.nixpkgs.follows = "nixpkgs";
        };*/

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        nix-flatpak.url = "github:gmodena/nix-flatpak";

    };

    outputs = inputs@{
        #fenix,
        home-manager,
        lix,
        nixpkgs,
        nixpkgs-stable,
        nix-flatpak,
        nix-ld,
        self,
        ...
    }: let 

        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-stable = nixpkgs-stable.legacyPackages.${system};
        username = "rick";
        name = "rick";

    in {

        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            inherit lib;
            modules = [

                ./system/configuration.nix
                home-manager.nixosModules.home-manager
                lix.nixosModules.default
                nix-flatpak.nixosModules.nix-flatpak
                nix-ld.nixosModules.nix-ld

                #==> Home-Manager <==#
                {
                    nixpkgs.config.allowUnfree = true;
                    _module.args = { inherit inputs; };
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.rick = import ./home-manager/home.nix;
                    home-manager.extraSpecialArgs = {
                        inherit username;
                        inherit name;
                        inherit inputs;
                        inherit pkgs-stable;
                        inherit self;
                    };
                }
            ];
            specialArgs = {
                inherit inputs;
                inherit pkgs-stable;
                inherit username;
                inherit self;
            };
            /*extraSpecialArgs = {
                inherit username;
                inherit name;
                inherit inputs;
                inherit self;
            };*/
        };
    };
}
