{

	description = "Best configuration";

	inputs = {
		# nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		# nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		# nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
		nixpkgs-unfree.url = "github:numtide/nixpkgs-unfree";
		nixpkgs-unfree.inputs.nixpkgs.follows = "nixpkgs";
                nur.url = "github:nix-community/NUR";


		home-manager = {
			# url = "github:nix-community/home-manager/release-24.05";
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

	outputs = { nixpkgs, nixpkgs-unfree, home-manager, ... }@inputs:
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
			};
			modules = [
                          ./nixos/configuration.nix
			  inputs.nixvim.nixosModules.nixvim
			];
		};

		homeConfigurations.bober = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};

			extraSpecialArgs = { inherit inputs; };

		 	modules = [ 
		 	  ./home-manager/home.nix ];

		};
	};

}
