{ inputs, ... }:
{
  imports = [
    inputs.mc-honeypot.nixosModules.default
  ];

  services.mc-honeypot = {
    enable = true;
    openFirewall = true;

    settings = {
      port = 25565;

      version-string = "Rweal Vewsiowon,, >w<";
      protocol-version = 1337;

      max-players = 69;
      online-players = 420;

      motd = "OwO, attempting to access a server... that doesnt exist >:3";
      icon-file = ./mc-honeypot-icon.png;

      webhook-url-file = "/etc/webhooks/mc-honeypot";
    };
  };
}
