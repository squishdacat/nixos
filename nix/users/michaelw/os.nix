{ ... }:
{
  users.users.michaelw = {
    isNormalUser = true;
    description = "michaelw";

    # NOTE: Remember to change the password on first login
    initialPassword = "password";

    openssh.authorizedKeys.keys = [

    ];

    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "kvm"
      "adbusers"
      "uucp"
      "dialout"

      "libvirtd"
      #"docker"
      "wireshark"

      "lp"
      "scanner"
      "camera"

      "disk"
      "optical"
      "floppy"
      "storage"
    ];

    
  };

  #This is what fixes the issue of xwayland-satellite not running unless started by the user
  #The xwayland-satellite package contains a systemd unit file but it is disabled by default?
  systemd.user.targets.graphical-session = {
      wants = [ "xwayland-satellite.service" ];
    };
}
