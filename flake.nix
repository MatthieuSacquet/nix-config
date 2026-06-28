{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        # nixvim.url = "github:nix-community/nixvim";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        zen-browser.url = "github:youwen5/zen-browser-flake";
        nvf.url = "github:notashelf/nvf";
        slippi = {
            url = "github:lytedev/slippi-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	    ssbm-nix = {
	      url = "github:NormalFall/ssbm-nix";
	      inputs.nixpkgs.follows = "nixpkgs"; # utilise ton nixpkgs pour éviter les doublons
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
