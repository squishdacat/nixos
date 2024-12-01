{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;

    packages = with pkgs; [
      # Contains alot of fonts
      # TODO: NixPkgs recently changed the namespace, update and look for fonts I want
      #nerd-fonts

      # MS Fonts
      corefonts
      vistafonts

      # Noto
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      # Monospace (Programming)
      jetbrains-mono
      fira-code
      fira-code-symbols

      # toki pona
      #linja-pi-pu-lukin # stylized
      nasin-nanpa # monospace

      # Minecraft-like
      scientifica # Programing
      monocraft
      miracode

      # Other
      open-dyslexic
      liberation_ttf
      proggyfonts
      dejavu_fonts
    ];

    fontconfig = {
      subpixel.rgba = "rgb";

      defaultFonts = {
        # TODO: Look at my fonts and see which ones I actually want as defaults
      };
    };
  };
}
