{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [
    config.services.vaultwarden.config.ROCKET_PORT
  ];

  services.vaultwarden = {
    enable = true;
    backupDir = "/var/backup/vaultwarden";

    # Reference https://github.com/dani-garcia/vaultwarden/blob/main/.env.template
    config = {
      DOMAIN = "https://vaultwarden.coolgi.dev";
      # NOTE: Nginx is doing the SSL signing
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;

      SIGNUPS_ALLOWED = false;

      SMTP_HOST = "127.0.0.1";
      SMTP_PORT = 25;
      SMTP_SSL = false;

      SMTP_FROM = "vaultwarden@coolgi.dev";
      SMTP_FROM_NAME = "Vaultwarden Server";
    };
  };

  services.nginx.virtualHosts."vaultwarden.coolgi.dev" = {
    forceSSL = true;
    enableACME = true;

    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
    };
  };
}
