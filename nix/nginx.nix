{ ... }:
{
  services.nginx = {
    enable = true;

    virtualHosts = {
      "www.localhost" = {
        root = "/var/www/";

        locations."/" = {
          index = "index.html";
        };
      };

      "gitlab.localhost" = {
        locations = {
          "/" = {
            proxyPass = "https://coolgi.gitlab.io";
          };

          "/potat" = {
            return = "https://funtimes909.xyz";
          };
        };
      };
    };
  };
}
