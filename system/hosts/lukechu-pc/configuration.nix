{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
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
        echo'Loading Linux linux ...'
        linux/vmlinuz-linux root=UUID=7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d rw  loglevel=3 quiet
        echo'Loading initial ramdisk ...'
        initrd/intel-ucode.img /initramfs-linux.img
    }
    submenu 'Advanced options for Arch Linux' $menuentry_id_option 'gnulinux-advanced-7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d' {
    menuentry 'Arch Linux, with Linux linux' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-linux-advanced-7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d' {
      set gfxpayload=keep
        insmod gzio
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root DF04-0904
        echo'Loading Linux linux ...'
        linux/vmlinuz-linux root=UUID=7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d rw  loglevel=3 quiet
        echo'Loading initial ramdisk ...'
        initrd/intel-ucode.img /initramfs-linux.img
    }
    menuentry 'Arch Linux, with Linux linux (fallback initramfs)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-linux-fallback-7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d' {
      set gfxpayload=keep
        insmod gzio
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root DF04-0904
        echo'Loading Linux linux ...'
        linux/vmlinuz-linux root=UUID=7c78b3e4-0ccc-4d7d-87b6-5baac728ad5d rw  loglevel=3 quiet
        echo'Loading initial ramdisk ...'
        initrd/intel-ucode.img /initramfs-linux-fallback.img
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
  time.timeZone = "Europe/London";

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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
