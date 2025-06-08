{...}:
{
        programs.virt-manager.enable = true;
        users.groups.libvirtd.members = ["michaelw"];

        virtualisation = {
                libvirtd.enable = true;
                spiceUSBRedirection.enable = true;
        };
}
