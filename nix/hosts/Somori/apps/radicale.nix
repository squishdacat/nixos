{ config, ... }:
{
  services.radicale = {
    enable = true;

    settings = {
      server = {
        # NOTE: In the ./nginx.nix, I set it up to use the first item in the list to bind to
        hosts = [
          # Localhost
          #"127.0.0.1:5232"
          "0.0.0.0:5232"
        ];
      };
      auth = {
        type = "htpasswd";
        htpasswd_filename = "/etc/radicale/users";
        htpasswd_encryption = "bcrypt";
      };
      storage = {
        # Default location
        filesystem_folder = "/var/lib/radicale/collections";
      };
      #web = {
      #  type = "none";
      #};
    };
  };

  services.nginx.virtualHosts."calendar.coolgi.dev" = {
    forceSSL = true;
    enableACME = true;

    locations."/" = {
      proxyPass = "http://${toString (builtins.elemAt config.services.radicale.settings.server.hosts 0)}";
      extraConfig = ''
        proxy_set_header  X-Script-Name /;
        proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass_header Authorization;
      '';
    };
  };
}
