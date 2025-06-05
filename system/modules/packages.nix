{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget

    vim
    neovim

    kitty
  ];
}
