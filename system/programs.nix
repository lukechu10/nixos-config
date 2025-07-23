{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  programs.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
  };
  programs.fish.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
