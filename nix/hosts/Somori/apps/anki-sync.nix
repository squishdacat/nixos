{ config, ... }:
{
  services.anki-sync-server = {
    enable = true;
    #openFirewall = true;

    users = [
      {
        username = "coolGi";
        passwordFile = "/etc/anki/passwords/coolGi";
      }
      {
        username = "octy";
        passwordFile = "/etc/anki/passwords/octy";
      }
    ];
  };

  services.nginx.virtualHosts."anki.coolgi.dev" = {
    forceSSL = true;
    enableACME = true;

    locations."/" = {
      proxyPass = "http://[::1]:${toString config.services.anki-sync-server.port}";
      extraConfig = ''
        proxy_set_header X-Real-IP $remote_addr;
      '';
    };
  };
}
