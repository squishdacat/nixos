{ lib, ... }:
{
  options.custom.hardware.displays = lib.mkOption {
    description = "List of all displays on the host";
    default = [];
    type = lib.types.listOf (lib.types.submodule { options = {
      enabled = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Whether to this display.";
      };

      id = lib.mkOption {
        type = lib.types.str;
        description = ''
          The id of this display.
          On Hyprland you can use `hyprctl monitors` to get a list of monitors.
        '';
      };

      width = lib.mkOption {
        type = lib.types.int;
        description = "The width of the display.";
      };
      height = lib.mkOption {
        type = lib.types.int;
        description = "The height of the display.";
      };
      x = lib.mkOption {
        type = lib.types.int;
        description = "The x position of the screen.";
      };
      y = lib.mkOption {
        type = lib.types.int;
        description = "The y position of the screen.";
      };

      rotation = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = ''
          The rotation of the screen in degree.
          NOTE: On Wayland, only multiples of 90 work.
        '';
      };

      refreshRate = lib.mkOption {
        type = lib.types.int;
        description = "The refresh rate of the screen.";
      };
    };});
  };
}
