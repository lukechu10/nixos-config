{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager } @ attrs: {
    nixosConfigurations.luke-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit attrs; };
      modules = [
        ./system/configuration.nix

		# Make home-manager a module of NixOS so that the home-manager configuration will be deployed automatically with nixos-rebuild switch
		home-manager.nixosModules.home-manager {
		  home-manager.useGlobalPkgs = true;
		  home-manager.useUserPackages = true;
		  home-manager.backupFileExtension = "hm-backup";

		  home-manager.users.luke = import ./home;
		}
      ];
    };
  };
}
