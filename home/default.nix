{ config, pkgs, ... }:

{
  imports = [ 
	./fish.nix
  	./fonts.nix
  ];

  home.username = "luke";
  home.homeDirectory = "/home/luke";

  home.packages = with pkgs; [
    neofetch
    lazygit
    starship

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
  ];

  programs.nix-index = {
  	enable = true;
	enableFishIntegration = true;
  };

  # Configure Git
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

  # Configure GitHub CLI
  programs.gh = {
	enable = true;
  };

  # Configure Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      tree-sitter
      wl-clipboard
      ripgrep
      fzf

      nodejs

	  # LSPs
	  harper
    ];
  };
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/nvim";

  programs.waybar.enable = true;

  # Configure Hyprland
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/hypr";

  # Configure Waybar
  home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/waybar";

  # Configure Rofi
  home.file.".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/rofi";

  # Configure Kitty
  home.file.".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/kitty";

  # Configure Starship
  home.file.".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/starship.toml";

  # Configure Cursor
  home.file.".local/share/icons".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/cursors";

  home.stateVersion = "25.05";
}
