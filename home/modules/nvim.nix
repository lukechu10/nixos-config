{ config, pkgs, ... }:

{
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
      lua-language-server
      harper
      nil
    ];
  };
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/nvim";
}
