{ pkgs, ... }:
{
  services.fail2ban = {
    enable = true;

    # Needed to ban on IPv4 and IPv6 for all ports
    extraPackages = [ pkgs.ipset ];
    banaction = "iptables-ipset-proto6-allports";

    # Ban after 5 failures in 600 sec
    maxretry = 5;
    #findtime = 600;

    bantime = "24h";

    daemonSettings = {
      DEFAULT = {
        mta = "sendmail";
        sender = "fail2ban@survices.coolgi.dev";
        destemail = "me@coolgi.dev";
      };
    };

    jails = {
      sshd.settings = {
        backend = "systemd";
        mode = "aggressive";
        port = 222;
      };

      ngnix-botsearch.settings = { 
        enabled = true;
        filter = "nginx-botsearch";
        logpath = "/var/log/nginx/access.log";
        backend = "auto"; # Do not forget to specify this if your jail uses a log file
        maxretry = 5;
        findtime = 600;
      }; 
    };
  };
}
