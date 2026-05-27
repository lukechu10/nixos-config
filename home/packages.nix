{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    lazygit

    nixfmt

    # Archives
    zip
    xz
    unzip
    p7zip

    # Utils
    ripgrep
    fd
    jq

    # Misc
    cowsay
    which
    tree
    gnupg
    zathura
    zotero
    inotify-tools # file system event monitoring

    # Syscall monitoring
    strace # system call tracing
    ltrace # library call tracing
    lsof # list open files

    # Notifications
    libnotify

    # Funsies
    cmatrix
    asciiquarium
  ];
}
