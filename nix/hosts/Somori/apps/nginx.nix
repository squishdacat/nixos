{ inputs, ... }:
{
  # HTTPS happens on port 443
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  #networking.enableIPv6 = true;

  # Rotate the logs
  services.logrotate.enable = true;


  services.nginx = {
    enable = true;

    # Set the max size to 1 GB
    clientMaxBodySize = "1G";

    # Use recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    appendHttpConfig = ''
      # Add HSTS header with preloading to HTTPS requests.
      # Adding this header to HTTP requests is discouraged
      map $scheme $hsts_header {
          https   "max-age=31536000; includeSubdomains; preload";
      }
      add_header Strict-Transport-Security $hsts_header;

      # Minimize information leaked to other domains
      add_header 'Referrer-Policy' 'origin-when-cross-origin';
    '';


    virtualHosts = {
      "coolgi.dev" = {
        forceSSL = true;
        enableACME = true;
        #useACMEHost = "coolgi.dev";

        default = true;

        listen = [
          { addr = "*";    port = 443; ssl = true; }
          { addr = "[::]"; port = 443; ssl = true; }
        ];

        #root = "/nix/store/vr9blbb7x6j4j3grzl9cfyb7di1ipmzj-zsh-5.9-doc/share/doc/zsh-5.9/";
        locations = {
          "/" = {
            #index = "index.html";
            return = "307 https://coolgi.gitlab.io/";
          };

          "/.well-known/" = {
            alias = "${inputs.self.outPath}/well-known/";
          };

          /*
          "/uwu/" = {
            #extraConfig = ''
            #  rewrite ^ ${inputs.self.outPath}/ascii/uwu.ascii break;
            #'';
            alias = "${inputs.self.outPath}/ascii/";
            index = "uwu.ascii";
          };
          */
        };
      };

      # Default rout for curl connections to coolgi.dev
      /*
      "_uwu" = {
        serverName = "coolgi.dev";
        listen = [
          { addr = "*";    port = 80; ssl = false; }
          { addr = "[::]"; port = 80; ssl = false; }
        ];

        extraConfig = ''
          if ( $http_user_agent ~ "curl" ) {
            #proxy_pass http://uwu.coolgi.dev/uwu/;
            #rewrite ^ http://uwu.coolgi.dev/uwu/ permanent;
            return 307 http://uwu.coolgi.dev/uwu/;
          }
        '';
      };
      "uwu.coolgi.dev" = {
        listen = [
          { addr = "*";    port = 80; ssl = false; }
          { addr = "[::]"; port = 80; ssl = false; }
        ];
        
        locations = {
          "/uwu/" = {
            alias = "${inputs.self.outPath}/ascii/";
            index = "uwu.ascii";
          };
          "/nya/" = {
            alias = "${inputs.self.outPath}/ascii/";
            index = "catgirl-bocchi.sixel";
          };
        };
      };
      */
    };
  };
}
