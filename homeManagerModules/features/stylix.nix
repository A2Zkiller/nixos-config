{
  pkgs,
  lib,
  ...
}: {
  # stylix.image = ;

  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;

  stylix.autoEnable = true;
}
