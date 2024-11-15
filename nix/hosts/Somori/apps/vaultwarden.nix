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

      # When a user logs in an email is required to be sent
      REQUIRE_DEVICE_EMAIL = false;

      WEB_VAULT_ENABLED = false;

      PASSWORD_HINTS_ALLOWED = false;
      SHOW_PASSWORD_HINT = false;

      LOGIN_RATELIMIT_MAX_BURST = 5;
      LOGIN_RATELIMIT_SECONDS = 86400; # One day

      SMTP_FROM = "vaultwarden@services.coolgi.dev";
      SMTP_FROM_NAME = "Vaultwarden Server";
      SMTP_HOST = "127.0.0.1";
      SMTP_PORT = 25;
      SMTP_SSL = false;
    };
  };

  services.nginx.virtualHosts."vaultwarden.coolgi.dev" = {
    forceSSL = true;
    enableACME = true;

    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
      extraConfig = ''
        proxy_set_header X-Real-IP $remote_addr;
      '';
    };
  };
}
