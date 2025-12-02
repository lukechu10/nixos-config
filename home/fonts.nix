{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    corefonts
    vista-fonts

    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans

    fira-code
    nerd-fonts.fira-code
    font-awesome
  ];

  fonts.fontconfig.enable = true;
}
