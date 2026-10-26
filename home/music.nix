{ config, pkgs, ... }: {
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    network.startWhenNeeded = true; # Only start mpd when a client connects
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };

  services.mpd-mpris.enable = true;

  programs.rmpc = {
    enable = true;
  };
  # Regenerate defaults with `rmpc config > rmpc.ron`.
  home.file.".config/rmpc/".source = config.lib.meta.mkMutableSymlink ./rmpc;

  home.packages = with pkgs; [
    yt-dlp
    spotdl
  ];
}
