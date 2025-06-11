{ ... }:

{
  imports = [
    ./hypr
    ./rofi
    ./waybar
    ./yazi

    ./firefox.nix
    ./fish.nix
    ./fonts.nix
    ./git.nix
    ./kitty.nix
    ./nixpkgs.nix
    ./nvim.nix
    ./starship.nix
    ./ui.nix

    ./packages.nix
    ./utils.nix
  ];

  home.username = "luke";
  home.homeDirectory = "/home/luke";

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  home.stateVersion = "25.05";
}
