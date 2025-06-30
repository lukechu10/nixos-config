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

      websocat

      # LSPs
      harper
      lua-language-server
      nil
      tailwindcss-language-server
      taplo
      tinymist
      vscode-langservers-extracted
    ];
  };
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/nvim";
}
