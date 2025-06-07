{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    lazygit
    starship

    nixfmt-rfc-style

    # Archives
    zip
    xz
    unzip
    p7zip

    # Utils
    ripgrep

    # Misc
    cowsay
    which
    tree
    gnupg
    rofi-wayland

    firefox

    # Syscall monitoring
    strace # system call tracing
    ltrace # library call tracing
    lsof # list open files

    # Misc
    inotify-tools # file system event monitoring
  ];

}
