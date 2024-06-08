{ ... }:
{
  console.useXkbConfig = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "workman";
    options = "caps:backspace";
  };
}
