{ inputs, ... }:
{
  imports = [
    inputs.simple-nixos-mailserver.nixosModule
  ];

  mailserver = {
    enable = true;
    openFirewall = true;
    certificateScheme = "acme-nginx";

    fqdn = "mail.coolgi.dev";
    domains = [ "coolgi.dev" ];

    # Default:   /var/vmail/example.com/user/.folder.subfolder/
    # FS Layout: /var/vmail/example.com/user/folder/subfolder/
    useFsLayout = true;

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      # Personal account
      "me@coolgi.dev" = {
        hashedPasswordFile = "/etc/mail/passwords/me@coolgi.dev";
        aliases = [
          "coolgi@coolgi.dev"
          "contact@coolgi.dev"
        ];
      };

      # Used to notify me about security stuff
      #"security@coolgi.dev" = {
      #  sendOnly = true;
      #};
    };


    extraVirtualAliases = {
      "abuse@coolgi.dev" = "me@coolgi.dev";
      "info@coolgi.dev" = "me@coolgi.dev";
      "postmaster@coolgi.dev" = "me@coolgi.dev";
    };
  };
}
