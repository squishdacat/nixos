{ ... }:
{
  imports = [
    ./../default

    ./../../../driver/gpu/amd.nix
  ];

  networking.hostName = "Dbasil";
}
