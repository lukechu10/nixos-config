{ config, pkgs, ... }:

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

  # Configure Hyprland
  home.file.".config/hypr".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/hypr";

  # Configure Waybar
  home.file.".config/waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/waybar";

  # Configure Rofi
  home.file.".config/rofi".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/rofi";

  # Configure Kitty
  home.file.".config/kitty".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/kitty";

  # Configure Starship
  home.file.".config/starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/starship.toml";

  # Configure Cursor themes
  home.file.".local/share/icons".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/cursors";

  home.stateVersion = "25.05";
}
