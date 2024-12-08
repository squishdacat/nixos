{ pkgs, ... }:
{
  programs.steam = {
    enable = true;

    protontricks.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    #dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Opens firewall for local game tranfers
    
    #package = pkgs.steam.override { withJava = true; };
    
    gamescopeSession.enable = true;
    extest.enable = true;

    # Just define this once so we don't need to rebuild steam fhs on font change
    fontPackages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      source-han-sans-japanese
      source-han-serif-japanese
    ];

    # Add proton ge
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  #programs.gamemode.enable = true;
  
  hardware.steam-hardware.enable = true; # Not needed, but nice to have
}
