{ ... }:
{
  console.useXkbConfig = true;
  services.xserver.xkb = {
    # I'm always gonna be using the US layout
    layout = "us";
    # and the only good thing about caps, is that it's a quick backspace
    options = "caps:backspace";
  };
}
