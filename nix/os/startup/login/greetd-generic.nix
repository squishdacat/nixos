{ pkgs, config, ... }:
{
  services.greetd = {
    enable = true;
    restart = true;

    vt = 7;
  };

  environment.systemPackages = with pkgs; [
    config.services.greetd.package
  ];
}
