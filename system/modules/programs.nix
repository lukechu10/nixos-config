{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.fish.enable = true;

  # Configure Gnupg
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
