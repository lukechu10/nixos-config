{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../..
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Disable man cache
  documentation.man.generateCaches = false;

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  # Do not use OS Prober as it takes too long.
  # boot.loader.grub.useOSProber = true;
  boot.loader.grub.extraEntries = ''
    menuentry 'Arch Linux' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d' {
      set gfxpayload=keep
        insmod gzio
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root DF04-0904
        echo 'Loading Linux linux ...'
        linux /vmlinuz-linux root=UUID=7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d rw  loglevel=3 quiet
        echo 'Loading initial ramdisk ...'
        initrd /intel-ucode.img /initramfs-linux.img
    }
    submenu 'Advanced options for Arch Linux' $menuentry_id_option 'gnulinux-advanced-7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d' {
    menuentry 'Arch Linux, with Linux linux' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-linux-advanced-7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d' {
      set gfxpayload=keep
        insmod gzio
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root DF04-0904
        echo 'Loading Linux linux ...'
        linux /vmlinuz-linux root=UUID=7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d rw  loglevel=3 quiet
        echo 'Loading initial ramdisk ...'
        initrd /intel-ucode.img /initramfs-linux.img
    }
    menuentry 'Arch Linux, with Linux linux (fallback initramfs)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-linux-fallback-7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d' {
      set gfxpayload=keep
        insmod gzio
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root DF04-0904
        echo 'Loading Linux linux ...'
        linux /vmlinuz-linux root=UUID=7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d rw  loglevel=3 quiet
        echo 'Loading initial ramdisk ...'
        initrd /intel-ucode.img /initramfs-linux-fallback.img
      }
    }
    menuentry 'Windows Boot Manager (on /dev/nvme0n1p1)' --class windows --class os $menuentry_id_option 'osprober-efi-BAEA-C954' {
      insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root BAEA-C954
        chainloader /efi/Microsoft/Boot/bootmgfw.efi
    }
  '';
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lukechu-pc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Configure power button
  services.logind.powerKey = "suspend";

  # Configure login manager
  environment.systemPackages = with pkgs; [ greetd.tuigreet ];
  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "tuigreet --cmd hyprland";
      };
    };
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
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  system.stateVersion = "25.05";
}
