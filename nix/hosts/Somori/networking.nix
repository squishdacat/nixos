{ ... }:
{
  networking = {
    nameservers = [
      ##### Porkbun Name Servers #####
      # alvador.ns.porkbun.com
      "162.159.10.150"
      "2400:cb00:2049:1::a29f:a96"
      # curitiba.ns.porkbun.com
      "173.245.58.37"
      "2400:cb00:2049:1::adf5:3a25"
      # fortaleza.ns.porkbun.com
      "162.159.8.140"
      "2400:cb00:2049:1::a29f:88c"
      # maceio.ns.porkbun.com
      "162.159.11.180"
      "2400:cb00:2049:1::a29f:bb4"
    ];
    # If using dhcpcd:
    #dhcpcd.extraConfig = "ipv4";
    # If using NetworkManager:
    #networkmanager.dns = "none";
  };

  # This make sure that our interface is named `eth0`.
  # This should be ok as long as you don't have multiple physical network cards
  # For multiple cards one could add a netdev unit to rename the interface based on the mac address
  networking.usePredictableInterfaceNames = false;

  systemd.network = {
    #enable = true;

    networks."eth0" = {
      enable = true;

      name = "eth0";

      address = [
        "185.193.17.204/24"

        "2a02:c206:2202:9155:0000:0000:0000:0001/64"
      ];
      gateway = [
        "185.193.17.1"

        "fe80::1"
      ];
      dns = [
        "213.136.95.10"
        "213.136.95.11"

        "2a02:c207::1:53"
        "2a02:c207::2:53"
      ];

      routes = [
        {
          Gateway = "185.193.17.1";
          Destination = "185.193.17.0/24";
          GatewayOnLink = true;
        }
        {
          Gateway = "fe80::1";
          Destination = "2a02:c206:2202:9155:0000:0000:0000:0001";
          GatewayOnLink = true;
        }
      ];
    };
  };
}
