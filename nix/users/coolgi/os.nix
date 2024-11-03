{ ... }:
{
  users.users.coolgi = {
    isNormalUser = true;
    description = "coolGi";

    # NOTE: Remember to change the password on first login
    initialPassword = "password";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKOuFI0KrlI1ywwcWmrAEVYvAiqwcDAdVYxS0+Og+Qvh coolgi@Dbasil"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGW5ePtcN+/WcyBjZRswx2qV6HSW/YdD1Pp/LW/vq2JG coolgi@Lsunny"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKVXGo8ZvCycoJswJSuZeGDEQ0lUWy7en5i8wlQ4eSF coolgi@Somori"
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
      "docker"

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
