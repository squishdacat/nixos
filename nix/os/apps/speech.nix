{ pkgs, ... }:
{
  services.speechd = {
    enable = true;

    package = pkgs.speechd.overrideAttrs (o: { withEspeak = true; });
  };
}
