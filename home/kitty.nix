{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = null;
    settings = {
      font_family = "FiraCode Nerd Font";
      confirm_os_window_close = 0;
      touch_scroll_multiplier = 3.0;
    };
  };
}
