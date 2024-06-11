{ config, pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  boot.kernelPatches = [
    {
      name = "bits-per-pixel fix + bigscreen EDID quirk";
      patch = ./bsb.patch;
    }
  ];
  #boot.kernelPatches = vivepro2-linux-driver.kernelPatches;

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="wheel"
  '';
}
