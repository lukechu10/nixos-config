{ config, pkgs, ... }:

{
  programs.waybar.enable = true;

  # Symlink the Waybar configuration files.
  home.file.".config/waybar".source = config.lib.meta.mkMutableSymlink ./.;
}
