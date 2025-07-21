{ confdig, pkgs, ... }:

{
  networking = {
    nameservers = [
      "1.1.1.1"
      "9.9.9.9"
    ];
    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "none";
  };
}
