{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

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
      pkgs-unstable.harper
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
  # Symlink the Neovim configuration files.
  # Note that we do not put the nvim.nix file itself in the nvim configuration directory, since it is a git submodule.
  home.file.".config/nvim".source = config.lib.meta.mkMutableSymlink ./nvim;

  # Neovide
  programs.neovide.enable = true;
}
