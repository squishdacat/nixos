{ ... }:
{
  imports = [
    ./polkit
    ./utils.nix
    ./steam.nix
    ./tailscale.nix
  ];


  # Android Debugger
  programs.adb.enable = true;
  # Authentication
  security.polkit.enable = true;
  # Configs
  programs.dconf.enable = true;
  programs.xfconf.enable = true;
  # For userspace file systems
  services.gvfs.enable = true;
  # Thumbnail managment
  services.tumbler.enable = true;
}
