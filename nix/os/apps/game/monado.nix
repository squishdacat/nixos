{ ... }:
{
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };

  #programs.envision = {
  #  enable = true;
  #  openFirewall = true; # This is set true by default
  #};

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
  };
}
