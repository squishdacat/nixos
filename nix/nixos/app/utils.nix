{ pkgs, ... }:
{
  # Some packages that I will always need
  environment.systemPackages = with pkgs; [
    gparted
    ffmpeg-full

    psmisc
    usbutils

    curl
    wget

    git
  ];
}
