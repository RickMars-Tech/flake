{
    description = "My NixOS Configuration";

    inputs = {

        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

        nixos-hardware.url = "github:NixOS/nixos-hardware/master";

        chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

        /*lix = {
            url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
            inputs.nixpkgs.follows = "nixpkgs";
        };*/

        nix-ld = {
            url = "github:Mic92/nix-ld";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";

        flatpaks.url = "github:GermanBread/declarative-flatpak/stable-v3";
    };

    outputs = inputs@{
        chaotic,
        flatpaks,
        home-manager,
        #lix,
        nixpkgs,
        nixpkgs-stable,
        nix-ld,
        nixos-hardware,
        self,
        ...
    }: let 

        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-stable = nixpkgs-stable.legacyPackages.${system};
        lib = nixpkgs.lib;
        username = "rick";
        name = "Rick";

    in {

        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            inherit lib;
            #inherit inputs;
            modules = [

                ./system/configuration.nix
                nixos-hardware.nixosModules.lenovo-thinkpad-t420
                chaotic.nixosModules.default
                flatpaks.nixosModules.default
                home-manager.nixosModules.home-manager
                #lix.nixosModules.default
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
                inherit name;
                inherit self;
            };
        };
    };
}
