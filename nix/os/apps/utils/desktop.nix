{ pkgs, ... }:
{
  imports = [
    ./v4l.nix
  ];

  environment.systemPackages = with pkgs; [
    mullvad
    mullvad-vpn
  ];

  services.mullvad-vpn.enable = true;


  # The set of english words (at $WORDLIST env var)
  #environment.wordList.enable = true;

  # Configs
  programs.dconf.enable = true;
  programs.xfconf.enable = true;
  # For userspace file systems
  services.gvfs.enable = true;
  # Camera support
  programs.gphoto2.enable = true;
  # Thumbnail managment
  services.tumbler.enable = true;


}
