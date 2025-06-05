{ config, pkgs, ... }:

{
  home.username = "luke";
  home.homeDirectory = "/home/luke";

  home.packages = with pkgs; [
    neofetch

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

    # Syscall monitoring
    strace # system call tracing
    ltrace # library call tracing
    lsof # list open files
  ];

  programs.git = {
    enable = true;
    userName = "Luke Chu";
    userEmail = "37006668+lukechu10@users.noreply.github.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      url = {
        "https://github.com/" = {
	  insteadOf = [ "gh:" "github:" ];
	};
      };
    };
  };

  home.stateVersion = "25.05";
}
