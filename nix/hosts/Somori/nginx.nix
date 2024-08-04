{ config, ... }:
{
  # HTTPS happens on port 443
  networking.firewall.allowedTCPPorts = [ 443 ];

  services.nginx = {
    enable = true;

    #defaultHTTPListenPort = 443;
    defaultListenAddresses = [ "*" ];

    virtualHosts = {
      "coolgi.dev" = {
        forceSSL = true;
        enableACME = true;

        default = true;

        #root = "/nix/store/vr9blbb7x6j4j3grzl9cfyb7di1ipmzj-zsh-5.9-doc/share/doc/zsh-5.9/";
        locations = {
          "/" = {
            #index = "index.html";
            return = "307 https://coolgi.gitlab.io/";
          };
        };
      };


      # Put Vaultwarden behind Nginx's reverse proxy
      #  so that nginx can handle SSL(/TLS) signing
      "vaultwarden.coolgi.dev" = {
        forceSSL = true;
        enableACME = true;

        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
        };
      };

      "calendar.coolgi.dev" = {
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
    };
  };
}
