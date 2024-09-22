{ pkgs, config, ... }:
{
  # 8448 is needed for federation
  networking.firewall.allowedTCPPorts = [ 8448 ];

  services.matrix-conduit = {
    enable = true;
    package = pkgs.conduwuit;

    settings = {
      global = {
        #address = "::1";
        server_name = "coolgi.dev";

        trusted_servers = [
          "matrix.org"
          "funtimes909.xyz"
        ];
      };
    };
  };

  services.nginx.virtualHosts."coolgi.dev" = {
    listen = [
      { addr = "*";    port = 8448; ssl = true; }
      { addr = "[::]"; port = 8448; ssl = true; }
    ];

    locations."/_matrix/" = {
      proxyPass = "http://[::1]:${toString config.services.matrix-conduit.settings.global.port}";
      extraConfig = ''
        proxy_set_header Host $host;
        proxy_buffering off;
        proxy_read_timeout 5m;
      '';
    };
  };
}
