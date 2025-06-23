{ config, pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs.sdl3
      pkgs.SDL2
      pkgs.SDL2_image
      pkgs.SDL2_mixer
      pkgs.SDL2_ttf
      pkgs.SDL2_gfx

      pkgs.xorg.libXinerama
      pkgs.libpng
      pkgs.freetype
    ] ++ pkgs.steam-run.args.multiPkgs pkgs;
  };
}
