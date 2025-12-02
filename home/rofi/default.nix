{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi
  ];

  # Symlink the Rofi configuration files.
  home.file.".config/rofi".source = config.lib.meta.mkMutableSymlink ./.;
}
