{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = null;
    settings = {
      font_family = "FiraCode Nerd Font";
      background_opacity = 0.9;
      confirm_os_window_close = 0;
    };
  };
}
