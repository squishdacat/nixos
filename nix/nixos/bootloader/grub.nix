{ ... }:
{
  boot.loader.grub = {
    efiSupport = true;

    device = "nodev";
    #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesnt work
  };
}
