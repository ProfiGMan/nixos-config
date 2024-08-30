{

  programs.bash = {
    enable = true;
    shellAliases = {
      v = "nvim";
      cat = "bat";
      re = "sudo nixos-rebuild switch --flake ~/nix";
      hre = "home-manager switch --flake ~/nix";
    };
    initExtra = ''
      eval "$(starship init bash)"
    '';
  };

}
