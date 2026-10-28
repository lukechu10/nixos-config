{ config, ... }:

{
  # Symlink the Hyprland configuration files.
  home.file.".config/hypr".source = config.lib.meta.mkMutableSymlink ./.;

  # Copy the mouse cursor themes.
  home.file.".local/share/icons".source = ./cursors;

  # General environment variables for all Wayland sessions.
  home.file.".config/uwsm/env".text = ''
    export XCURSOR_SIZE=24
    export HYPRCURSOR_SIZE=24
    export HYPRCURSOR_THEME=Bibata-Modern-Classic
    export GDK_SCALE=2

    export GDK_BACKEND=wayland,x11,*
    export QT_QPA_PLATFORM=wayland
    export SDL_VIDEODRIVER=wayland
    export ELECTRON_OZONE_PLATFORM_HINT=auto
  '';

  # Hyprland-specific environment variables.
  # Use iGPU for laptop screen and dGPU for external monitors.
  # Alienware 13 R3 has HDMI and DP ports connected to dGPU so it's impossible to use iGPU for external monitors.
  home.file.".config/uwsm/env-hyprland".text = ''
    export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card0"
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export NVD_BACKEND=direct
  '';
}
