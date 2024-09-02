{ clib, ... }:
{
  imports = clib.aimport {
    path = ./.;
    exclude = [ ./default.nix ];
  };
}
