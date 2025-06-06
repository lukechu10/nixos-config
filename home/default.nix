{ ... }:

{
  imports = [
    ./hypr
    ./rofi
    ./waybar
    ./yazi

    ./fish.nix
    ./fonts.nix
    ./git.nix
    ./kitty.nix
    ./nvim.nix
    ./starship.nix

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
