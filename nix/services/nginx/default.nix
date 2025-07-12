{pkgs, ...}:
{
  imports = [
    ./acme.nix
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedProxySettings = true;

    virtualHosts."jellyfin2.lukeandmichael.au" = {
      useACMEHost = "lukeandmichael.au";
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8096";
        proxyWebsockets = true;
      };
    };
  };

}
