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
}
