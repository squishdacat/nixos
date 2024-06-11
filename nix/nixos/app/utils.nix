{ pkgs, ... }:
{
  # Some packages that I will always need
  environment.systemPackages = with pkgs; [
    psmisc
    usbutils

    curl
    wget

    git
  ];
}
