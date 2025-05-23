{ ... }:
{
  networking = {
    # We are using systemd.network instead
    useDHCP = false;
  };

  # This make sure that our interface is named `eth0`.
  # This should be ok as long as there arent multiple physical network cards
  # For multiple cards one could add a netdev unit to rename the interface based on the mac address
  networking.usePredictableInterfaceNames = false;

  systemd.network = {
    enable = true;

    # Use the vendors thingie for IPv4 DHCP
    #config.dhcpV4Config = { DUIDType = "vendor"; };

    networks."Saubrey" = {
      enable = true;

      # Interface name
      name = "eth0";

      # Use the vendors thingie for IPv4 DHCP
      dhcpV4Config = {
        UseDNS = true;
        UseRoutes = true;
      };

      # Somori's spesific network settings
      address = [
        "192.168.1.226/24"

        #"2a02:c206:2202:9155:0000:0000:0000:0001/64"
      ];
      gateway = [
        "192.168.1.254"

        #"fe80::1"
      ];
      dns = [
        #"213.136.95.10"
        #"213.136.95.11"

        #"2a02:c207::1:53"
        #"2a02:c207::2:53"
      ];

      routes = [
        {
          Gateway = "192.168.1.254";
          Destination = "192.168.1.254/24";
          GatewayOnLink = true;
        }
        #{
        #  Gateway = "fe80::1";
        #  Destination = "2a02:c206:2202:9155:0000:0000:0000:0001/64";
        #  GatewayOnLink = true;
        #}
      ];
    };
  };
}
