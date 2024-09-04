{ ... }:
{
  users.users.coolgi = {
    isNormalUser = true;
    description = "coolGi";

    # NOTE: Remember to change the password on first login
    initialPassword = "password";

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

      "lp"
      "scanner"

      "disk"
      "optical"
      "floppy"
      "storage"
    ];
  };
}
