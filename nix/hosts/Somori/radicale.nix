{ ... }:
{
  networking.firewall.allowedTCPPorts = [ 5232 ];

  services.radicale = {
    enable = true;

    settings = {
      server = {
        # NOTE: In the ./nginx.nix, I set it up to use the first item in the list to bind to
        hosts = [
          # Localhost
          #"127.0.0.1:5232"
          "0.0.0.0:5232"
        ];
      };
      auth = {
        type = "htpasswd";
        htpasswd_filename = "/etc/radicale/users";
        htpasswd_encryption = "bcrypt";
      };
      storage = {
        # Default location
        filesystem_folder = "/var/lib/radicale/collections";
      };
      #web = {
      #  type = "none";
      #};
    };
  };
}
