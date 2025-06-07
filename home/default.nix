{ ... }:
{
  imports = [
    ./modules
  ];

  home.username = "luke";
  home.homeDirectory = "/home/luke";

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  home.stateVersion = "25.05";
}
