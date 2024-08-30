# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, pkg-unfree, ... }@pkgs-unfree:
# let
#   overlay-unstable = final: prev: {
#     unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
#   };
# in
{
  # disabledModules = [ "services/display-manager/ly.nix" ];
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-bundle.nix
      ./nixvim.nix
      ./keyd.nix
      <home-manager/nixos>
      # ./greetd.nix
    ];

  home-manager.users.bober = { pkgs, ... }: {
    imports = [ ./home-manager/home.nix ];
  };
  
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    # nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    # package = inputs.nixpkgs-unfree.legacyPackages."x86_64-linux".linuxPackages_latest.nvidiaPackages.stable;
    package = inputs.nixpkgs-unfree.legacyPackages.x86_64-linux.linuxPackages.nvidiaPackages.production;
  };

  # nixpkgs.overlays = [ overlay-unstable ]; 

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sdb"; # or "nodev" for efi only
  # boot.loader.grub.useOSProber = true;
  # boot.kernelPackages = inputs.nixpkgs-stable.legacyPackages.x86_64-linux.linuxPackages_latest;
  # boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
  # nixpkgs.config.allowUnfree = true;
  boot.supportedFilesystems = [ "ntfs" ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "BoberPC"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  programs.hyprland = {
    enable = true;
    # package = inputs.nixpkgs-stable.legacyPackages.x86_64-linux.hyprland;
  };
  # services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.graphics = {
  #   enable = true;
  #   extraPackages = with pkgs; [
  #     vaapiVdpau
  #     libvdpau-va-gl
  #   ];
  # };
  # hardware.nvidia = {
  #   package = inputs.nixpkgs-unfree.legacyPackages.x86_64-linux.linuxPackages.nvidiaPackages.production;
  #   # package = config.boot.kernelPackages.nvidiaPackages.stable;
  #   modesetting.enable = true;
  #   open = false;
  #   forceFullCompositionPipeline = true;
  #   powerManagement.enable = true;
  # };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
  };
  services = {
    displayManager.ly = {
      enable = true;
      settings = {
        animation = "matrix";
	auth_fails = 2;
	clock = "%c";
      };
      # package = pkgs.unstable.ly; # also use the package from the unstable channel!
    };
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bober = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # neovim
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    firefox
    yazi
    kitty
    telegram-desktop
    rofi-wayland
    copyq
    waybar
    hyprpaper
    home-manager
    bat
    swaynotificationcenter
    wl-clipboard
    btop
    greetd.tuigreet
    wget
    brightnessctl
    pamixer
    starship
    playerctl
    hypridle
    xwayland
    gparted
    xorg.xhost
    ntfs3g
    udiskie
    # wlogout
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  # programs.firefox.policies = {
  #   ExtensionSettings = with builtins;
  #     let extension = shortId: uuid: {
  #       name = uuid;
  #       value = {
  #         install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
  #         installation_mode = "normal_installed";
  #       };
  #     };
  #     in listToAttrs [
  #       (extension "tree-style-tab" "treestyletab@piro.sakura.ne.jp")
  #       (extension "ublock-origin" "uBlock0@raymondhill.net")
  #       (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
  #       (extension "tabliss" "extension@tabliss.io")
  #       (extension "umatrix" "uMatrix@raymondhill.net")
  #       (extension "libredirect" "7esoorv3@alefvanoon.anonaddy.me")
  #       (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
  #     ];
  #     # To add additional extensions, find it on addons.mozilla.org, find
  #     # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
  #     # Then, download the XPI by filling it in to the install_url template, unzip it,
  #     # run `jq .browser_specific_settings.gecko.id manifest.json` or
  #     # `jq .applications.gecko.id manifest.json` to get the UUID
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # services = {

  #   greetd = {
  #     enable = true;
  #     settings = {
  #       default_session = {
  #         command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
  #         user = "greeter";
  #       };
  #     };
  #   };

  # };
  # services.displayManager.ly.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

