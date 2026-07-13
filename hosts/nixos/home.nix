{ config, pkgs, inputs, ... }:

{

    home.username = "matth";
    home.homeDirectory = "/home/matth";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "25.11"; # Please read the comment before changing.

    imports = [
        inputs.plasma-manager.homeManagerModules.plasma-manager
        ../../modules/home-manager/btop.nix
        ../../modules/home-manager/kitty.nix
        ../../modules/home-manager/zsh.nix
        ../../modules/home-manager/fish.nix
        ../../modules/home-manager/oh_my_posh/oh_my_posh.nix
        ../../modules/home-manager/nvf/default.nix
        ../../modules/home-manager/neovide.nix
        ../../modules/home-manager/plasma_config/default_plasma_config.nix

        ./note_workspaces.nix
    ];
    # The home.packages option allows you to install Nix packages into your
    # environment.

    home.packages = with pkgs; [
        hello
        kittysay
        mission-center
        lazygit
        zed-editor
        ripgrep
        lsd
        bat
        vlc
        python3
        wl-clipboard
        valgrind
        zellij
    ];

    programs.btop.settings.selected_battery = "BAT1";

    programs.fish.shellAliases = {
        "n" = "nvim";
        "ls" = "lsd";
        "rebuild" = "sudo nixos-rebuild switch --flake ~/nix-config/#nixos";
        "update" = "cd ~/nix-config && nix flake update && rebuild";
    };

    programs.kitty.shellIntegration.enableFishIntegration = true;
    programs.kitty.settings.shell = "${pkgs.fish}/bin/fish";

    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "MatthieuSacquet";
                email = "matthieu.sacquet@epitech.eu";
            };
            init.defaultBranch = "main";
        };
    };

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
        # # Building this configuration will create a copy of 'dotfiles/screenrc' in
        # # the Nix store. Activating the configuration will then make '~/.screenrc' a
        # # symlink to the Nix store copy.
        # ".screenrc".source = dotfiles/screenrc;

        # # You can also set the file content immediately.
        # ".gradle/gradle.properties".text = ''
        #   org.gradle.console=verbose
        #   org.gradle.daemon.idletimeout=3600000
        # '';
    };

    home.sessionVariables = {
        # EDITOR = "emacs";
    };

    programs.home-manager.enable = true;
}
