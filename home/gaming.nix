{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wineWowPackages.staging
    winetricks

    gamescope
    mangohud
  ];
}
