{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;

    packages = with pkgs; [
      # Contains alot of fonts
      nerdfonts

      # MS Fonts
      corefonts
      vistafonts

      # Noto
      noto-fonts
      noto-fonts-cjk
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
