{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
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

    package = inputs.conduwuit.packages.x86_64-linux.all-features;
    #package = pkgs.conduwuit;

    settings = {
      global = {
        #address = "::1";
        server_name = "coolgi.dev"; # Cannot be changed!
        max_request_size = 100000000; # 100MB (in bytes)

        # Allow for accessing admin commands out of the room
        admin_escape_commands = true;

        # 1 - Ipv4Only (Only query for A records, no AAAA/IPv6)
        # 2 - Ipv6Only (Only query for AAAA records, no A/IPv4)
        # 3 - Ipv4AndIpv6 (Query for A and AAAA records in parallel, uses whatever
        #                   returns a successful response first)
        # 4 - Ipv6thenIpv4 (Query for AAAA record, if that fails then query the A record)
        # 5 - Ipv4thenIpv6 (Query for A record, if that fails then query the AAAA record)
        ip_lookup_strategy = 5;

        # Allow the public room dir to be publically federated
        allow_public_room_directory_over_federation = true;

        # Trusted servers to get some keys from
        trusted_servers = [
          "matrix.org"
        ];

        # URL previews
        url_preview_check_root_domain = true;
        url_preview_max_spider_size = 256000; # 256KB (in bytes)
        url_preview_domain_explicit_allowlist = [
          # Git
          "github.com"
          "gitlab.com"
          "codeberg.org"
          # Git Pages
          "github.io"
          "gitlab.io"
          "codeberg.page"
          # General
          "wikipedia.org"
          "xkcd.com"
          "bandcamp.com"
          "steampowered.com"
          # Streaming
          "youtube.com"
          "youtu.be"
          "spotify.com"
          # Social Media
          "x.com"
          "xcancel.com"
        ];

        auto_deactivate_banned_room_attempts = true;

        # Logging/Debugging
        #log = "debug";
      };
    };
  };

  # We use our own package for conduwuit, so we need to change the systemd service exec
  systemd.services.conduit.serviceConfig.ExecStart =
    lib.mkForce "${config.services.matrix-conduit.package}/bin/conduwuit";

  services.nginx.virtualHosts."coolgi.dev" = {
    listen = [
      {
        addr = "*";
        port = 8448;
        ssl = true;
      }
      {
        addr = "[::]";
        port = 8448;
        ssl = true;
      }
    ];

    locations =
      let
        url = "http://[::1]:${toString config.services.matrix-conduit.settings.global.port}";
      in
      {
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
        # Small little joke :3
        "/_matrix/federation/v1/version" = {
          priority = 999; # Default is 1000, so this is lower
          return =
            "200 '"
            + (builtins.toJSON {
              server = {
                name = "UwU";
                version = "0.69.420 (furry edition!)";
              };
            })
            + "'";
          extraConfig = ''
            add_header Content-Type application/json;
          '';
        };
      };
  };
}
