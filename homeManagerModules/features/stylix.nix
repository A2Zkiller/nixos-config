{
  pkgs,
  lib,
  ...
}: {
  # stylix.image = ;

  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;

  cursor.name = "Bibata-Modern-Ice";
  cursor.package = pkgs.bibata-cursors;

  stylix.autoEnable = true;
}
