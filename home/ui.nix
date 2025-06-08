{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    adw-gtk3
  ];

  home.file.".config/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-icon-theme-name = Adwaita
    gtk-theme-name = adw-gtk3-dark
    gtk-application-prefer-dark-theme = true
  '';
}
