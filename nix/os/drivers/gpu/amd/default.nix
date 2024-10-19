{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware = {
    graphics = {
      enable32Bit = true;

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
