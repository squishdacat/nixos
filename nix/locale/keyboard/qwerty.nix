{ ... }:
{
  console.useXkbConfig = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "caps:backspace";
  };
}
