{
  pkgs,
  ...
}:

{
  programs.hyprland = {
    enable = true;
    # TODO: We are not actually using UWSM yet but we enable it to prevent a cache miss with Hydra. See https://github.com/NixOS/nixpkgs/issues/496640 for more details.
    withUWSM = true;
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
