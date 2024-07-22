{ ... }:
{
  imports = [
  ];

  services.openssh = {
    enable = true;
    ports = [ 222 ];

    settings = {
      PasswordAuthentication = false; # Must authenticate with the ssh key
      PermitRootLogin = "no"; # Dont allow logging in as root
    };
  };

  services.fail2ban = {
    enable = true;
    bantime = "1d";
  };
}
