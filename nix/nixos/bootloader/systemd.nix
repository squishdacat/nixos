{ ... }:
{
  boot.loader.systemd-boot = {
    enable = true;

    # Users can gain root access by passing "init=/bin/sh" if
    #  they are able to edit the boot stuff
    editor = false;

    memtest86.enable = true;
    #netbootxyz.enable = true;
  };
}
