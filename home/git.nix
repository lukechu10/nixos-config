{ config, pkgs, ... }:

{
  # Configure Git
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Luke Chu";
        email = "37006668+lukechu10@users.noreply.github.com";
      };
      commit.gpgSign = true;
      init = {
        defaultBranch = "main";
      };
      url = {
        "https://github.com/" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };
      };
    };
  };

  # Configure GitHub CLI
  programs.gh = {
    enable = true;
  };
}
