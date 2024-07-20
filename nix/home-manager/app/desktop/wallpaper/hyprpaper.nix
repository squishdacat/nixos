{ config, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    
    #settings = {
    #  preload = "${config.stylix.image}";
    #  wallpaper = ",${config.stylix.image}";
    #};
  };

  #home.file."${config.xdg.configHome}/hypr/hyprpaper.conf".onChange = ''
  #  ${pkgs.systemd}/bin/systemctl --user restart hyprpaper.service
  #'';
  
}
