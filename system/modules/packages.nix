{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Misc
    which
    git
    gh # GitHub CLI
    wget

    # Editor
    vim
    neovim

    # Hyprland
    # Note that hyprland itself is configured in programs.nix
    hyprpaper
    hyprcursor
    hypridle
    hyprsunset
    hyprlock

    # Build tools
    gcc
    clang
    gnumake

    # Rust
    rustup
  ];
}
