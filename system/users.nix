{ config, pkgs, ... }:

{
  users.users.luke = {
    isNormalUser = true;
    description = "Luke Chu";
    extraGroups = [
      "networkmanager"
      "wheel"
      # SANE scanner group
      "scanner"
      "lp"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  nix.settings.trusted-users = [
    "@wheel"
  ];
}
