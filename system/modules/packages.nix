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

	# Terminal
    kitty

	# Hyprland
	# Note that hyprland itself is configured in programs.nix
	hyprpaper
	hyprcursor
	hypridle
	hyprsunset

    # Build tools
    gcc
    clang
    gnumake

	# Rust
	rustup
  ];
}
