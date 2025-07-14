{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      eval (starship init fish)

      # Add Cargo's bin directory to the PATH
      # This allows us to use tools installed via `cargo install`.
      fish_add_path ~/.cargo/bin

      # Enable direnv integration
      direnv hook fish | source
    '';
  };
}
