{pkgs, ...}:
{
  
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
  
  services.jellyfin = {
    enable = true;
    #openfirewall = true; Doesn't exist?
  };

  networking.firewall = {
    #allowedUDPPorts = [ 8096 ];
    #allowedTCPPorts = [ 8096 ];
  };
  
}
