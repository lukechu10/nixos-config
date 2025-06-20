{ config, pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = [
      pkgs.SDL2
      pkgs.SDL2_image
      pkgs.SDL2_ttf
      pkgs.xorg.libXinerama
      pkgs.libpng
      pkgs.freetype
    ] ++ pkgs.steam-run.args.multiPkgs pkgs;
  };
}
