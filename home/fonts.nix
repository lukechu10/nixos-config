{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    corefonts
    vista-fonts

    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-extra

    fira-code
    nerd-fonts.fira-code
    font-awesome
  ];

  fonts.fontconfig.enable = true;
}
