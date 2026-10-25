{
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./alienfx.nix
    ./graphics.nix
    ./hardware-configuration.nix
    ../..
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.splashImage = null;
  boot.loader.grub.fontSize = 30;
  # Do not use OS Prober as it takes too long.
  # boot.loader.grub.useOSProber = true;
  boot.loader.grub.extraEntries = ''
    menuentry 'Windows Boot Manager (on /dev/nvme0n1p1)' --class windows --class os $menuentry_id_option 'osprober-efi-BAEA-C954' {
      insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root BAEA-C954
        chainloader /efi/Microsoft/Boot/bootmgfw.efi
    }
  '';
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable USB storage and SD card modules in initrd
  boot.initrd.availableKernelModules = [
    "usb_storage"
    "sd_mod"
  ];

  networking.hostName = "lukechu-pc"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    tuigreet
    libimobiledevice
    ifuse
  ];

  # Set your time zone.
  time.timeZone = lib.mkForce null;
  services.automatic-timezoned.enable = true;

  # Configure power button
  services.logind.settings.Login.HandlePowerKey = "suspend";

  # Configure login manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland";
      };
    };
    useTextGreeter = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Sudo configuration.
  security.sudo.extraConfig = ''
    Defaults timestamp_type=global
    Defaults timestamp_timeout=10
  '';

  # Enable bluetooth support
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Printing support
  services.printing.enable = true;
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  #   openFirewall = true;
  # };

  # Scanning support
  hardware.sane.enable = true;

  # USB Automounting
  services.udisks2.enable = true;

  # Enable mounting iOS devices
  services.usbmuxd.enable = true;

  # Mount /tmp to tmpfs
  boot.tmp.useTmpfs = true;

  system.stateVersion = "25.05";
}
