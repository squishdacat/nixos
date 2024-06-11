{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    psmisc
    usbutils

    curl
    wget

    git
  ];
}
