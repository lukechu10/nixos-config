{ config, pkgs, ... }:

{
  users.users.luke = {
    isNormalUser = true;
    description = "Luke Chu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "luke";
}
