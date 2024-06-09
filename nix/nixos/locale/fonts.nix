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

      # Minecraft-like
      scientifica # Programing
      monocraft
      miracode

      # Other
      liberation_ttf
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      dejavu_fonts
    ];
  };
}
