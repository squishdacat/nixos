{ ... }: {
  # See https://lvra.gitlab.io/docs/distros/nixos/#steamvr
  boot.kernelPatches = [
    {
      name = "allow any ctx priority on amdgpu";
      # See https://github.com/Frogging-Family/community-patches/blob/a6a468420c0df18d51342ac6864ecd3f99f7011e/linux61-tkg/cap_sys_nice_begone.mypatch
      patch = ./cap_sys_nice_begone.patch;
    }
  ];
}
