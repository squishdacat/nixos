{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false; # Whether to power up the bluetooth controller on boot

    settings = {
      General.Experimental = true; # Show battery level
    };
  };
  services.blueman.enable = true;
}
