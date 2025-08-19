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
      basedpyright
      clang-tools
      fsautocomplete
      harper
      lua-language-server
      nil
      roslyn-ls
      tailwindcss-language-server
      taplo
      tinymist
      typescript-language-server
      vscode-langservers-extracted

      vscode-extensions.vadimcn.vscode-lldb
    ];
  };
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/nvim";
}
