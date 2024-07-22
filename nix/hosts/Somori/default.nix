{ ... }:
{
  imports = [
    ./../defaults/server.nix
  ];


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };


  # Networking ports
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "me@coolgi.dev";

    certs."coolgi.dev" = {
      dnsProvider = "porkbun";
      webroot = null;

      environmentFile = "/etc/ssl/porkbun-tokens";
    };
  };

  services.nginx = {
    enable = true;

    #defaultHTTPListenPort = 443;
    defaultListenAddresses = [ "*" ];

    virtualHosts = {
      "coolgi.dev" = {
        forceSSL = true;
        enableACME = true;

        #root = "/nix/store/vr9blbb7x6j4j3grzl9cfyb7di1ipmzj-zsh-5.9-doc/share/doc/zsh-5.9/";
        locations = {
          "/" = {
            #index = "index.html";
            return = "https://coolgi.gitlab.io/";
          };
        };
      };
    };
  };



  # TODO #
  #  cockpit : Desktop management
}
