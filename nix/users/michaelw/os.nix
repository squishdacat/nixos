{ ... }:
{
  users.users.michaelw = {
    isNormalUser = true;
    description = "michaelw";

    # NOTE: Remember to change the password on first login
    initialPassword = "password";

    openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCGqh3Kt1M+3OMOV6h2X5PBQMmsv5hs5JANzSs1BjdcYd5HMin16z+mlabhuigGy/75dVyOxhZwVhOa57ykD9JsP5JAkmd9EBmql7Wr1bmvor7MMbJQxr9IuO4T4sqcmDxJBShdjiiKBatwIpq6IBcrhi6U4p9r4R3MjyPyAhc0JCiK+9mD4YID0KSF/bRktjbb+CrP1uOHltSgtktNTb3W76ULxHUc/DAwGSTVzu+qz00pgR3wxjbF75Mn71J7zPOf3M5zDFdbbow+Dst5U/O+nBdb+nl6ykkQNS7wAvo7HUASvGVGwMdkBYBaRsXRtRasScgJ7FDnxFqfHK0BaGqxIwx1BGYhBcWQONFvnoaGmivSGWyWrItnrFrMyNiUC7Z7kLur0YpoBE0FHw8W2XBq9bSHZLvWJljOsup7l/6iIoOVCcZcvoxCFRnzwfMS7GOC51AazCbpYbBYHsS61lICMhMC34Rfc18o5HXqjtGu4OWUXDJaz9eRw7skZj5f/sNBpSiPHUECtvPsalUYPTuQHeBk0vwdcf7JGzxZGeAG+sFltzXd/Q33Rk6bhluNbDy6y9yCpHzwtxDIXQRdDuSU/gTm+kA6AU9qX8xM9x9RJ6Spd2FFk8zdK174El5YLiPOm84s6JbAnCfjIODdKInxwCXeJprg4yZS0oV8nCNQQ== openpgp:0x6FA32D5E"

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
