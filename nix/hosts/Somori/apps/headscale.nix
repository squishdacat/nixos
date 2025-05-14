{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [
    8080
    9090
  ];

  services.headscale = {
    enable = true;

    settings = {
      server_url = "https://headscale.coolgi.dev";
      listen_addr = "0.0.0.0:8080";
      metrics_listen_addr = "0.0.0.0:9090";
      #tls_cert_path = "";
      #tls_key_path = "";
    };
  };

  services.nginx.virtualHosts."headscale.coolgi.dev" = {
    forceSSL = true;
    enableACME = true;

    locations."/" = {
      proxyPass = "http://${toString config.services.headscale.settings.listen_addr}";
      proxyWebsockets = true;
    };
  };
}
