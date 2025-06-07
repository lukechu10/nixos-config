{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    corefonts
    vista-fonts

    nerd-fonts.fira-code
    font-awesome
  ];
}
