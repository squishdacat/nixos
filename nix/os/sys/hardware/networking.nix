{ ... }:
{
  networking.networkmanager = {
    enable = true;

    wifi.macAddress = "random";
    ethernet.macAddress = "preserve";

    #wifi.powersave = true;
  };

  # Provide different DNS servers
  networking.nameservers = [
    # Cloudflare
    "1.1.1.1"
    # quad9
    "9.9.9.10"
  ];

  # Disable networkmanager from trying to connect to the network on boot,
  #  (improving boot speed)
  # TODO: May be a good ida to enable this on the server
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  networking.firewall.allowedUDPPorts = [2021 1900];
  networking.firewall.allowedTCPPorts = [1883 322 990];
  # If a network proxy is ever needed
  #networking.proxy = {
  #  default = "http://user:password@proxy:port/";
  #  noProxy = "127.0.0.1,localhost,internal.domain";
  #};

  # This is supposed to be the toggle for wpa_supplicant
  #  but wpa is enabled without it, so I'm not sure why
  #  this should be enabled
  #networking.wireless.enable = true;
}
