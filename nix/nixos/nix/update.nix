{ ... }:
{
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";

    operation = "boot";
    allowReboot = false;
  };
}
