{
  config,
  pkgs,
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
    wasmtime # WebAssembly runtime

    # Editor
    vim
    neovim

    # Hyprland
    # Note that Hyprland itself is configured in programs.nix
    hyprcursor
    hypridle
    hyprsunset

    # Build tools
    gcc
    clang
    gnumake

    nodejs
    rustup
    typst

    dotnet-sdk_9
    fantomas # F# source code formatter

    devenv
    direnv

    perf

    # USB automounting (see https://wiki.hypr.land/Useful-Utilities/Other/#automatically-mounting-using-udiskie)
    udiskie
  ];
}
