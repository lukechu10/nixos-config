{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.fish.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
