{ clib, ... }:
{
  imports = [
    ./../../locale
    ./../../apps/sys
  ] ++ clib.aimport {
    path = ./../../sys/hardware;
  };
}
