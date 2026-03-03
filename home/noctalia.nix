{ pkgs, attrs, ... }:
{
  programs.noctalia-shell = {
    enable = true;
    package = pkgs.noctalia-shell;
    settings = { };
  };
}
