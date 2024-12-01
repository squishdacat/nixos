{ ... }:
{
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  # The current version (as of 2024/12/01) of OpenTabletDriver needs this version
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-6.0.36"
    "dotnet-sdk-6.0.428"
    "dotnet-sdk-wrapped-6.0.428"
  ];
}
