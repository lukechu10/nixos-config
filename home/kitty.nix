{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = null;
    settings = {
      font_family = "FiraCode Nerd Font";
      confirm_os_window_close = 0;
      touch_scroll_multiplier = 3.0;
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
    };
  };
}
