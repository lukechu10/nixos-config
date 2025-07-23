{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      eval (starship init fish)

      fish_add_path ~/.cargo/bin
      fish_add_path ~/.dotnet/tools

      # Enable direnv integration
      direnv hook fish | source
    '';
  };
}
