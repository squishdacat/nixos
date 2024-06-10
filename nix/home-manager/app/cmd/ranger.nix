{ pkgs, configs, ... }:
{
  programs.ranger = {
    enable = true;
    settings = {
      show_hidden = true;
      preview_images = true;
      preview_images_method = "kitty";
    };
  };
}
