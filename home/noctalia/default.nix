{ config, pkgs, ... }:
{
  programs.noctalia = {
    enable = true;
  };
  home.file.".config/noctalia/config.toml".source = config.lib.meta.mkMutableSymlink ./config.toml;
}
