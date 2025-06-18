# This file supplements the Home Manager configuration for gaming-related packages and settings that must have root privileges.
{ config, pkgs, ... }:

{
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
  };
}
