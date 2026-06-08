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
        # nixosConfigurations.gaming = nixpkgs.lib.nixosSystem {
        #     specialArgs = {inherit inputs;};
        #     modules = [
        #         ./hosts/nixos/configuration.nix
        #         inputs.home-manager.nixosModules.default
        #     ];
        # };
    };
}
