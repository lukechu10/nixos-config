{ config, pkgs, ... }:

{
  # Configure Hyprland
  home.file.".config/hypr".source = config.lib.meta.mkMutableSymlink ./config;
  # config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/modules/hypr/config";
}
