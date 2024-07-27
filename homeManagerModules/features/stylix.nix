{
  pkgs,
  lib,
  ...
}: {
  # stylix.image = ./prism/wallpapers/gruvbox-mountain-village.png;

  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;

  stylix.autoEnable = true;
}
