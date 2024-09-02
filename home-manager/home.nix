{ config, pkgs, inputs, ... }:

{
  home.username = "bober";
  home.homeDirectory = "/home/bober";
  home.stateVersion = "24.05"; 

  imports = [
    #inputs.nur.hmModules.nur
    ./hyprland.nix
    ./waybar.nix
    ./bash.nix
    ./tridactylrc.nix
    ./kitty.nix
    ./starship.nix
    ./wlogout.nix
    ./hypridle.nix
    ./copyq.nix
    ./btop.nix
    ./yazi/yazi.nix
    ./git.nix
    # ./firefox.nix
  ];

  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [ pkgs.tridactyl-native ];
    #profiles.default.extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
    profiles.default.extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
      ublock-origin
      tridactyl
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
