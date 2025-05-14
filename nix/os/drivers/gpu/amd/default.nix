{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware = {
    graphics = {
      #extraPackages = [ pkgs.amdvlk ];
      #extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
    };

    # For OpenCL
    #extraPackages = with pkgs; [
    #  rocmPackages.clr.icd
    #  # For extra info
    #  clinfo
    #];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
