{ config, lib, ... }:
with lib;

{
  config = mkMerge [
    {
      lib.meta = {
        configPath = "${config.home.homeDirectory}/nixos-config/"; # Path to the NixOS configuration repository
        mkMutableSymlink =
          path:
          config.lib.file.mkOutOfStoreSymlink (
            config.lib.meta.configPath + removePrefix (toString ./..) (toString path)
          );
      };
    }
  ];
}
