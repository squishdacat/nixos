{ ... }:
{
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    #dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    
    #package = pkgs.steam.override { withJava = true; };
    
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
  
  hardware.steam-hardware.enable = true; # Not needed, but nice to have
}
