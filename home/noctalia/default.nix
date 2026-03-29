{ pkgs, attrs, ... }:
{
  programs.noctalia-shell = {
    enable = true;
    package = pkgs.noctalia-shell;
    # Noctalia settings can be easily retrieved as a JSON file.
    # To update the current settings, run `noctalia-shell ipc call state all | jq .settings > settings.json`.
    settings = builtins.fromJSON (builtins.readFile ./settings.json);
  };
}
