{ ... }:
{
  boot.loader.systemd-boot = {
    enable = true;

    memtest86.enable = true;
    #netbootxyz.enable = true;
  };
}
