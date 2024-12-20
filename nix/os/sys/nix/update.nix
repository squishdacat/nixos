{ inputs, lib, ... }:
{
  system.autoUpgrade = {
    enable = true;
    dates = "Sat,Sun,Tue,Thu 03:00:00"; # Every second day (except weekends)
    randomizedDelaySec = "1hour";

    operation = lib.mkDefault "boot";
    persistent = lib.mkDefault false;
    allowReboot = lib.mkDefault false;
    # if reboot is allowed (like on a server), then add a reboot window
    rebootWindow = { lower = "03:00"; upper = "05:00"; };

    # TODO: Add a way to get this from the git repo's upstream url
    flake = "gitlab:coolGi/dotfiles";

    flags = [
      "--update-input"
      "nixpkgs"
      #"--no-write-lock-file"
      "-L" # print build logs
    ];
  };
}
