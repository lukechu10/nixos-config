{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

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
    pkgs-unstable.hyprpaper
    pkgs-unstable.hyprcursor
    pkgs-unstable.hypridle
    pkgs-unstable.hyprsunset
    pkgs-unstable.hyprlock

    # Build tools
    gcc
    clang
    gnumake

    nodejs
    rustup
    typst

    dotnet-sdk_9
    dotnet-runtime_9
    dotnet-ef

    devenv
    direnv
  ];
}
