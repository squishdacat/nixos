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

    # /var/vmail/example.com/user/.folder.subfolder/ (default layout)
    # /var/vmail/example.com/user/folder/subfolder/ (FS layout)
    useFsLayout = true;

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      "me@coolgi.dev" = {
        hashedPasswordFile = "/etc/mail/passwords/me@coolgi.dev";
        aliases = [
          "coolgi@coolgi.dev"
          "contact@coolgi.dev"
        ];
      };
    };
  };
}
