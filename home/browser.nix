{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = [ "en-US" ];
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
    ];
    package = pkgs.chromium.override {
      enableWideVine = true;
    };
  };
}
