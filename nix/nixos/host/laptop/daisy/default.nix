{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../default

    ./../../../driver/school/wifi/cert.nix
  ];

  networking.hostName = "Ldaisy";
}
