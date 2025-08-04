{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Misc
    which
    git
    gh # GitHub CLI
    wget
    btop-cuda # System monitor

    # Editor
    vim
    neovim

    # Hyprland
    # Note that Hyprland itself is configured in programs.nix
    hyprpaper
    hyprcursor
    hypridle
    hyprsunset
    hyprlock

    # Build tools
    gcc
    clang
    gnumake

    nodejs
    rustup
    typst

    dotnet-sdk_9

    devenv
    direnv

    config.boot.kernelPackages.perf
  ];
}
