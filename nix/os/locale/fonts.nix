{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;

    packages = (with pkgs; [
      # Noto
      noto-fonts
      noto-fonts-extra
      noto-fonts-cjk-sans
      noto-fonts-emoji

      # MS Fonts
      corefonts
      vistafonts

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
      source-han-sans-japanese
      source-han-serif-japanese
    ]) ++ (with pkgs.nerd-fonts; [
      noto
      hack
      meslo-lg

      roboto-mono
      ubuntu
      ubuntu-mono
      profont
    ]);

    fontconfig = {
      subpixel.rgba = "rgb";

      defaultFonts = {
        # TODO: Look at my fonts and see which ones I actually want as defaults
      };
    };
  };
}
