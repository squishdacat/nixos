{ ... }:
{
  imports = [
    ./../defaults/server.nix
    ./acme.nix
    ./nginx.nix
    ./mail.nix
    ./vaultwarden.nix
  ];


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };




  #networking = {
  #  nameservers = [
  #    ##### Porkbun Name Servers #####
  #    # alvador.ns.porkbun.com
  #    "162.159.10.150"
  #    "2400:cb00:2049:1::a29f:a96"
  #    # curitiba.ns.porkbun.com
  #    "173.245.58.37"
  #    "2400:cb00:2049:1::adf5:3a25"
  #    # fortaleza.ns.porkbun.com
  #    "162.159.8.140"
  #    "2400:cb00:2049:1::a29f:88c"
  #    # maceio.ns.porkbun.com
  #    "162.159.11.180"
  #    "2400:cb00:2049:1::a29f:bb4"
  #  ];
  #  # If using dhcpcd:
  #  dhcpcd.extraConfig = "nohook resolv.conf";
  #  # If using NetworkManager:
  #  networkmanager.dns = "none";
  #};



  # TODO #
  #  cockpit : Desktop management
}
