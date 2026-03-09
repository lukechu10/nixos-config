{ pkgs, ... }:

{
  imports = [
    ./gaming.nix
    ./networking.nix
    ./nix-ld.nix
    ./packages.nix
    ./programs.nix
    ./users.nix
  ];

  nixpkgs.overlays = [ ];

  # Disable man cache. This dramatically speeds up NixOS rebuilds.
  documentation.man.cache.enable = false;

  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
  networking.nftables.enable = true;

  # Add additional binary caches to prevent rebuilds from source.
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos-cuda.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    ];
  };
}
