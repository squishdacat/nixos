{ ... }:
{
  imports = [
    ./../defaults/server.nix
    ./mail.nix
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

  #networking = {
  #  nameservers = [
  #    ##### Porkbun Name Servers #####
  #    # alvador.ns.porkbun.com
  #    "162.159.10.150"
  #    "2400:cb00:2049:1::a29f:a96"
  #    # curitiba.ns.porkbun.com
  #    "173.245.58.37"
  #    "2400:cb00:2049:1::adf5:3a25"
  #    # fortaleza.ns.porkbun.com
  #    "162.159.8.140"
  #    "2400:cb00:2049:1::a29f:88c"
  #    # maceio.ns.porkbun.com
  #    "162.159.11.180"
  #    "2400:cb00:2049:1::a29f:bb4"
  #  ];
  #  # If using dhcpcd:
  #  dhcpcd.extraConfig = "nohook resolv.conf";
  #  # If using NetworkManager:
  #  networkmanager.dns = "none";
  #};

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
