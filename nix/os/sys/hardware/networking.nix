{ ... }:
{
  networking.networkmanager = {
    enable = true;

    wifi.macAddress = "random";
    ethernet.macAddress = "preserve";

    #wifi.powersave = true;
  };

  # Disable networkmanager from trying to connect to the network on boot,
  #  (improving boot speed)
  # TODO: May be a good ida to enable this on the server
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

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
