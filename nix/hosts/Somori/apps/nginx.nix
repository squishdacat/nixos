{ ... }:
{
  # HTTPS happens on port 443
  networking.firewall.allowedTCPPorts = [ 443 ];
  #networking.enableIPv6 = true;

  services.nginx = {
    enable = true;

    #defaultHTTPListenPort = 443;
    # Same as "*" and "[::]"
    #defaultListenAddresses = [ "0.0.0.0" "[::0]" ];


    virtualHosts = {
      "coolgi.dev" = {
        forceSSL = true;
        enableACME = true;

        default = true;

        listen = [
          { addr = "*";    port = 443; ssl = true; }
          { addr = "[::]"; port = 443; ssl = true; }
        ];

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
