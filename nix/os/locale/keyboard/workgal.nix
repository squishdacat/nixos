{ ... }:
{
  imports = [ ./default.nix ];
  services.xserver.xkb = {
    variant = "workgal";

    extraLayouts = {
      workgal = {
        description = "A high efficency keyboard layout inspired by Workman";
        languages = [ "eng" ];
        symbolsFile = ./workgal;
      };
    };
  };
}
