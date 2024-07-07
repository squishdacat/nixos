{ inputs, ... }:
{
  system.autoUpgrade = {
    enable = true;
    dates = "Sat,Sun,Tue,Thu 03:00:00"; # Every second day (except weekends)
    randomizedDelaySec = "1hour";

    operation = "boot";
    allowReboot = false;

    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      #"--no-write-lock-file"
      "-L" # print build logs
    ];
  };
}
