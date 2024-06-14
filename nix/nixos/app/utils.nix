{ pkgs, ... }:
{
  # Some packages that I will always need
  environment.systemPackages = with pkgs; [
    gparted

    psmisc
    usbutils

    curl
    wget

    git
  ];
}
