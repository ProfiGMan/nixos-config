{

  description = "Best configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unfree.url = "github:numtide/nixpkgs-unfree";
    nixpkgs-unfree.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unfree, nur, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
        };
      };
      # pkgs-unfree = import nixpkgs-unfree {
        # inherit system;
      # };
    in {
    nixosConfigurations.BoberPC = nixpkgs.lib.nixosSystem {
      inherit system;
      # specialArgs = { inherit inputs; pkgs = pkgs; };
      specialArgs = {
        inherit inputs;
        inherit nixpkgs-unfree;
        # pkgs-stable = import nixpkgs-stable {
        #   inherit system;
        #   config.allowUnfree = true;
        # };
        pkgs-unfree = import nixpkgs-unfree {
          inherit system;
          config.allowUnfree = true;
        };
	pkgs-nur = import nur {
	  inherit system;
	};
      };
      modules = [
        ./nixos/configuration.nix
        nixvim.nixosModules.nixvim
	home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.users.bober = import ./home-manager/home.nix;
	}
      ];
    };

    homeConfigurations.bober = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
 
      extraSpecialArgs = { inherit inputs; };
 
      modules = [ ./home-manager/home.nix ];
 
    };
  };
}
