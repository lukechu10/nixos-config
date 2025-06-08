{ attrs, ... }:

{
  home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme".source = attrs.firefox-gnome-theme;
  programs.firefox = {
    enable = true;
    profiles.default = {
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
      '';
      userContent = ''
        @import "firefox-gnome-theme/userContent.css";
      '';
      settings = {
        # Firefox Gnome Theme settings
        # https://github.com/rafaelmardojai/firefox-gnome-theme/blob/4eb2714fbed2b80e234312611a947d6cb7d70caf/configuration/user.js
        # (copied into here because home-manager already writes to user.js)
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable customChrome.cs
        "browser.uidensity" = 0; # Set UI density to normal
        "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
        "browser.theme.dark-private-windows" = false; # Disable private window dark theme
        "widget.gtk.rounded-bottom-corners.enabled" = true; # Enable rounded bottom window corners
      };
    };
  };
}
