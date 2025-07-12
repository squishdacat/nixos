{ config, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults.email = "certs@lukeandmichael.au";
  };
  security.acme.certs."lukeandmichael.au" = {
    domain = "*.lukeandmichael.au";
    email = "certs@lukeandmichael.au";
    dnsProvider = "cloudflare";
    credentialsFile = "/var/lib/acme/cloudflare-creds";
    group  = "nginx";
  };
}
