{ lib, config, pkgs, inputs, ... }:
{
  # 8448 is needed for federation
  networking.firewall.allowedTCPPorts = [ 8448 ];


  nix.settings = {
    substituters = [
      #"https://attic.kennel.juneis.dog/conduit"
      "https://attic.kennel.juneis.dog/conduwuit"
      #"https://conduwuit.cachix.org"
    ];
    trusted-public-keys = [
      #"conduit:eEKoUwlQGDdYmAI/Q/0slVlegqh/QmAvQd7HBSm21Wk="
      "conduwuit:lYPVh7o1hLu1idH4Xt2QHaRa49WRGSAqzcfFd94aOTw="
      #"conduwuit.cachix.org-1:MFRm6jcnfTf0jSAbmvLfhO3KBMt4px+1xaereWXp8Xg="
    ];
  };

  services.matrix-conduit = {
    enable = true;

    package = inputs.conduwuit.packages.${config.nixpkgs.hostPlatform}.all-features;
    #package = pkgs.conduwuit;

    settings = {
      global = {
        #address = "::1";
        server_name = "coolgi.dev";

        max_request_size = 100000000; # 100MB (in bytes)

        trusted_servers = [
          "matrix.org"
        ];

        url_preview_check_root_domain = true;
        url_preview_max_spider_size = 256000; # 256KB (in bytes)
        url_preview_domain_explicit_allowlist = [
          "wikipedia.org"
          "youtube.com"
          "youtu.be"
          "xkcd.com"
        ];
      };
    };
  };

  # We use our own package for conduwuit, so we need to change the systemd service exec
  systemd.services.conduit.serviceConfig.ExecStart = lib.mkForce "${config.services.matrix-conduit.package}/bin/conduwuit";

  services.nginx.virtualHosts."coolgi.dev" = {
    listen = [
      { addr = "*";    port = 8448; ssl = true; }
      { addr = "[::]"; port = 8448; ssl = true; }
    ];

    locations = let
      url = "http://[::1]:${toString config.services.matrix-conduit.settings.global.port}";
    in {
      "/_matrix/" = {
        proxyPass = url;
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_buffering off;
          proxy_read_timeout 5m;


          access_log /var/log/nginx/access_matrix.log;
        '';
      };
    };
  };
}
