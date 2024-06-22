{ ... }:
{
  imports = [
    ./../default

    ./../../../driver/school/wifi/cert.nix
  ];

  networking.hostName = "Ldaisy";
}
