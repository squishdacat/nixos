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
      dovecot.settings = {
        # block IPs which failed to log-in
        # aggressive mode add blocking for aborted connections
        filter = "dovecot[mode=aggressive]";
        maxretry = 3;
      };

      /*
      ngnix-botsearch.settings = { 
        enabled = true;
        filter = "nginx-botsearch";
        logpath = "/var/log/nginx/access.log";
        backend = "polling";
        failregex = "^ \[error\] \d+#\d+: \*\d+ (\S+ )?\"\S+\" (failed|is not found) \(2\: No such file or directory\), client\: <HOST>, server\: \S*\, request: \"(GET|POST|HEAD) \/favicon\.ico \S+\"\, host: \"\S*\".*?";
      }; 
      */

      /*
      nginx-botsearch = ''
        enabled  = true
        port     = http,https
        logpath  = /var/log/nginx/access.log
        backend  = polling
        journalmatch =
      '';
      */

      nginx-bad-request.settings = {
        enabled  = true;
        port     = "http,https";
        logpath  = "/var/log/nginx/access.log";
        backend  = "polling";
        journalmatch = "";
      };
    };
  };
}
