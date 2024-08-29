{ ... }:
{
  # TODO: Setup fail2ban
  services.fail2ban = {
    enable = false;
    maxretry = 5;
    bantime = "1d";


    jails = {
      #nginx-spam.settings = {
      #  enabled  = true;
      #  filter   = "nginx-bruteforce";
      #  logpath  = "/var/log/nginx/access.log";
      #  backend  = "auto";
      #  maxretry = 6;
      #  findtime = 600;
      #};
    };
  };
}
