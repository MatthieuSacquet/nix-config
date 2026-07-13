# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
    imports = [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.default
    ];

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    # Bootloader.
    # boot.loader.systemd-boot.enable = false;
    # boot.loader.efi.canTouchEfiVariables = false;

    boot = {
        loader = {
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot"; # ← use the same mount point here.
            };
            grub = {
                enable = true;
                efiSupport = true;
                #efiInstallAsRemovable = true;
                device = "nodev";
            };
            systemd-boot.enable = false;
        };
        kernelPackages = pkgs.linuxPackages_cachyos-lts;
    };

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Paris";

    # fix the bug when Rebuild -> layout set at default (us)
    environment.variables = {
        XKB_DEFAULT_LAYOUT = "fr";
        XKB_DEFAULT_VARIANT = "";
    };
    services.displayManager.sddm.settings.General.GreeterEnvironment =
        "XKB_DEFAULT_LAYOUT=fr,XKB_DEFAULT_VARIANT=";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "fr_FR.UTF-8";
        LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = false;
    services.desktopManager.gnome.enable = false;

    # Enable Cinnamon

    services.xserver.desktopManager.cinnamon.enable = false;
    # services.xserver.displayManager.lightdm.enable = true;
    environment.cinnamon.excludePackages = [
        pkgs.blueman
    ];

    # Enable KBE

    # Enable Plasma
    services.desktopManager.plasma6.enable = true;

    # Default display manager for Plasma
    services.displayManager.sddm = {
        enable = true;

        # To use Wayland (Experimental for SDDM)
        wayland.enable = true;
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
        konsole
        elisa
    ];

    hardware.bluetooth = {
        enable = true;
        powerOnBoot = false;
    };
    # services.displayManager.plasma-login-manager.enable = false; # enable when I use unstable branch

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "fr";
        variant = "";
    };

    # Configure console keymap
    console.keyMap = "fr";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    home-manager = {
        backupFileExtension = "backup";
        extraSpecialArgs = { inherit inputs; };
        users = {
            "matth" = import ./home.nix;
        };
    };

    programs.zsh.enable = true;
    programs.fish.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.matth = {
        isNormalUser = true;
        description = "Matth";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];
        packages = with pkgs; [
        #  thunderbird
        ];
        shell = pkgs.fish;
    };

        #Garbage
        nix.gc = {
            automatic = true;
            dates = [ "8:00" ];
            options = "--delete-older-than 15d";
        };

    # Install firefox.
    programs.firefox.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;


    services.flatpak.enable = true;
    # List packages installed in system profile. To search, run:
    # $ nix search wget

    programs.gamemode.enable = true; # for performance mode

    programs.steam = {
        enable = true; # install steam
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        #  wget
        kitty
        neovim
        fastfetch
        discord
        git
        btop
        dust
        tree
        gcc
        cargo
        gnumake
        flatpak
        inputs.zen-browser.packages.${system}.default
        clang
        cmake
        cbonsai

        inputs.slippi.packages.x86_64-linux.default
        heroic # install heroic launcher
        lutris # install lutris launcher
        mumble # install voice-chat
        protonup-qt # GUI for installing custom Proton versions like GE_Proton
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?

}
