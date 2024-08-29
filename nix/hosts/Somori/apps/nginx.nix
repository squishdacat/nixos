{ ... }:
{
  # HTTPS happens on port 443
  networking.firewall.allowedTCPPorts = [ 443 ];

  services.nginx = {
    enable = true;

    #defaultHTTPListenPort = 443;
    defaultListenAddresses = [ "*" ];

    virtualHosts = {
      "coolgi.dev" = {
        forceSSL = true;
        enableACME = true;

        default = true;

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
