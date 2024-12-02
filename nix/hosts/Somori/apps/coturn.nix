{ config, ... }:
{
  # Firewall for this
  networking.firewall = 
    let
      range = with config.services.coturn; [
        {
          from = min-port;
          to = max-port;
        }
      ];
    in
    {
      allowedUDPPortRanges = range;
      allowedUDPPorts = [
        config.services.coturn.listening-port
        5349
      ];
    };

  services.coturn = rec {
    enable = true;

    realm = "turn.coolgi.dev";

    use-auth-secret = true;
    #static-auth-secret-file = "/etc/matrix/coturn_key";
    static-auth-secret = "do i *really* need a secret >w<, pls dont hack";

    min-port = 49000;
    max-port = 50000;
    listening-port = 3478;

    # VoIP traffic is all UDP. There is no reason to let users connect to arbitrary TCP endpoints via the relay.
    no-tcp-relay = true;
    # I'm not gonna be needing the cli
    no-cli = true;

    # TODO: Find a better way of doing this
    cert = "/var/lib/acme/${realm}/full.pem";
    pkey = "/var/lib/acme/${realm}/key.pem";

    extraConfig = ''
      # consider whether you want to limit the quota of relayed streams per user (or total) to avoid risk of DoS.
      user-quota=16 # 4 streams per video call, so 16 streams = 4 simultaneous relayed calls per user.
      total-quota=1600 # 100 maxed user quotas


      # Ban private IP ranges
      # see https://www.rtcsec.com/article/slack-webrtc-turn-compromise-and-bug-bounty/#how-to-fix-an-open-turn-relay-to-address-this-vulnerability
      # and https://nixos.wiki/wiki/Matrix
      no-multicast-peers
      denied-peer-ip=0.0.0.0-0.255.255.255
      denied-peer-ip=10.0.0.0-10.255.255.255
      denied-peer-ip=100.64.0.0-100.127.255.255
      denied-peer-ip=127.0.0.0-127.255.255.255
      denied-peer-ip=169.254.0.0-169.254.255.255
      denied-peer-ip=172.16.0.0-172.31.255.255
      denied-peer-ip=192.0.0.0-192.0.0.255
      denied-peer-ip=192.0.2.0-192.0.2.255
      denied-peer-ip=192.88.99.0-192.88.99.255
      denied-peer-ip=192.168.0.0-192.168.255.255
      denied-peer-ip=198.18.0.0-198.19.255.255
      denied-peer-ip=198.51.100.0-198.51.100.255
      denied-peer-ip=203.0.113.0-203.0.113.255
      denied-peer-ip=240.0.0.0-255.255.255.255
      denied-peer-ip=::1
      denied-peer-ip=64:ff9b::-64:ff9b::ffff:ffff
      denied-peer-ip=::ffff:0.0.0.0-::ffff:255.255.255.255
      denied-peer-ip=100::-100::ffff:ffff:ffff:ffff
      denied-peer-ip=2001::-2001:1ff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=2002::-2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=fc00::-fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=fe80::-febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff

      # special case the turn server itself so that client->TURN->TURN->client flows work
      # this should be one of the turn server's listening IPs
      allowed-peer-ip=10.0.0.1
    '';
  };

  services.matrix-conduit.settings = {
    global = {
      turn_uris = [
        "turn:${config.services.coturn.realm}:${toString config.services.coturn.listening-port}?transport=udp"
      ];

      #turn_secret_file = "${config.services.coturn.static-auth-secret-file}";
      turn_secret = "${config.services.coturn.static-auth-secret}";
    };
  };

  # get a certificate
  services.nginx = {
    virtualHosts = {
      "${config.services.coturn.realm}" = {
        forceSSL = true;
        enableACME = true;

        listen = [{
          addr = "0.0.0.0";
          port = 80;
          ssl = false;
        }];

        locations."/".proxyPass = "http://127.0.0.1:1380";
      };
    };
  };

  # share certs with coturn and restart on renewal
  /*
  security.acme.certs = {
    "${config.services.coturn.realm}" = {
      group = "turnserver";
      allowKeysForGroup = true;
      postRun = "systemctl restart coturn.service";
    };
  };
  */
}
