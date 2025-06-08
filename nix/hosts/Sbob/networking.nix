{ lib, ...}:
{
        #Make sure servers are using systemd networking instead of Network Manager
        networking.networkmanager.enable = lib.mkOverride false;
        networking.useNetworkd = lib.mkOverride true;
        systemd.network = { 
                enable = lib.mkOverride true;
                networks."10-lan" = {
                        matchConfig.Name = "eno1 enp5s0";
                        networkConfig.DHCP = "yes";
                        linkConfig.RequiredForOnline = "no";
                };
        };
        
}
