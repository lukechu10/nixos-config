{ ... }:

{
  imports = [
    ./gaming.nix
    ./nix-ld.nix
    ./packages.nix
    ./programs.nix
    ./users.nix
  ];

  nixpkgs.overlays = [ (import ./overlays.nix) ];
}
