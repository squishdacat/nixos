{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      # Better UI
      #modernz
      uosc
      # Torrent Streaming
      webtorrent-mpv-hook
      # Quick cutting of vids (Shift+W to activate)
      mpv-webm
      # Image viewing
      #mpv-image-viewer

      # For YT
      sponsorblock
      #quality-menu # Change yt video quality
    ];

    config = {
      osc = false;
    };
  };
}
