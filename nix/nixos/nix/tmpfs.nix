{ ... }:
{
  # Mount /tmp on ram (as nix puts it on disk by default)
  #  WARNING: If there isnt enough ram on the system, DONT ENABLE THIS
  #           (large nix builds can take up alot of /tmp space)
  #boot.tmp.useTmpfs = true;

  # If /tmp is stored on disk, this clears it on boot
  boot.tmp.cleanOnBoot = true;
}
