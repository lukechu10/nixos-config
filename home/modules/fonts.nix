{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    corefonts
    vista-fonts

    fira-code
    nerd-fonts.fira-code
    font-awesome
  ];
}
