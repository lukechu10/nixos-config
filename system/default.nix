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
}
