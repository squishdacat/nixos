{ ... }:
{
  # HTTPS happens on port 443
  networking.firewall.allowedTCPPorts = [ 443 ];
  #networking.enableIPv6 = true;

  # Rotate the logs
  services.logrotate.enable = true;


  services.nginx = {
    enable = true;

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
        };
      };
    };
  };
}
