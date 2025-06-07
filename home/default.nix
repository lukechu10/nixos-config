{
  config,
  pkgs,
  lib,
  ...
}:

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

  programs.waybar.enable = true;

  # Configure Waybar
  home.file.".config/waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/waybar";

  # Configure Rofi
  home.file.".config/rofi".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/rofi";

  # Configure Starship
  home.file.".config/starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/starship.toml";

  home.stateVersion = "25.05";
}
