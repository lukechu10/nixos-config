{ config, pkgs, ... }:

{
  # Symlink the Hyprland configuration files.
  home.file.".config/hypr".source = config.lib.meta.mkMutableSymlink ./config;

  # Copy the mouse cursor themes.
  home.file.".local/share/icons".source = ./cursors;
}
