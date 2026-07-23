{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser.url = "github:youwen5/zen-browser-flake";

        nvf.url = "github:notashelf/nvf";

        plasma-manager = {
            url = "github:nix-community/plasma-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
        };

        ssbm-nix = {
            url = "github:NormalFall/ssbm-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        noctalia = {
            url = "github:noctalia-dev/noctalia/legacy-v4";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        niri = {
            url = "github:sodiboo/niri-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    };

    outputs = { self, nixpkgs, nvf, ... }@inputs: {
        # use "nixos", or your hostname as the name of the configuration
        # it's a better practice than "default" shown in the video
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./hosts/nixos/configuration.nix
                inputs.home-manager.nixosModules.default
                inputs.chaotic.nixosModules.default # IMPORTANT
            ];
        };
        nixosConfigurations.gaming = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./hosts/gaming/configuration.nix
                inputs.home-manager.nixosModules.default
                inputs.chaotic.nixosModules.default # IMPORTANT
            ];
        };
        nixosConfigurations.brike = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./hosts/brike/configuration.nix
                inputs.home-manager.nixosModules.default
                inputs.chaotic.nixosModules.default # IMPORTANT
            ];
        };
        nixosConfigurations.simple = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./hosts/simple/configuration.nix
            ];
        };
    };
}
