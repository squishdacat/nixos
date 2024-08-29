{ ... }:
{
  # ACME authenticates on port 80
  networking.firewall.allowedTCPPorts = [ 80 ];

  # Configuration for ACME
  security.acme = {
    acceptTerms = true;
    defaults.email = "me@coolgi.dev";

    certs."coolgi.dev" = {
      dnsProvider = "porkbun";
      webroot = null;

      environmentFile = "/etc/ssl/porkbun-tokens";
    };
  };
}
