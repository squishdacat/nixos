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

  services.nginx.virtualHosts."coolgi.dev" = {
    locations = let
      url = "http://[::1]:${toString config.services.anki-sync-server.port}";
    in {
      "/sync/" = {
        proxyPass = url;
      };
      "/msync/" = {
        proxyPass = url;
      };
    };
  };
}
