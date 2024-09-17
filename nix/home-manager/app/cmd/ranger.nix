{ pkgs, config, ... }:
{
  programs.ranger = {
    enable = true;
    settings = {
      show_hidden = true;
      preview_images = true;
      preview_images_method = if config.programs.kitty.enable then "kitty" else "sixel";
    };
  };
}
