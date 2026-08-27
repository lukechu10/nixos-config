{
  config,
  pkgs,
  ...
}:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };
  programs.fish.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    settings = {
      default-cache-ttl = 86400; # 24 hours
      max-cache-ttl = 604800; # 7 days
    };
  };
}
