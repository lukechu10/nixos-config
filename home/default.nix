{ config, ... }:

{
  imports = [
    ./hypr
    ./rofi
    ./waybar
    ./yazi

    ./firefox.nix
    ./fish.nix
    ./fonts.nix
    ./gaming.nix
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

  programs.nh = {
    enable = true;
    clean.extraArgs = "--keep-since 7d";
    flake = config.lib.meta.configPath;
  };

  home.stateVersion = "25.05";
}
