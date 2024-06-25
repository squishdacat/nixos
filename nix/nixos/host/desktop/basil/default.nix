{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../default

    ./../../../driver/gpu/amd.nix
  ];

  networking.hostName = "Dbasil";
}
