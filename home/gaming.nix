{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wineWow64Packages.waylandFull
    winetricks

    gamescope
    mangohud

    prismlauncher
  ];
}
