{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    lazygit

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
    zathura
    inotify-tools # file system event monitoring

    # Syscall monitoring
    strace # system call tracing
    ltrace # library call tracing
    lsof # list open files
  ];

}
