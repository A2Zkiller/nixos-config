{
  pkgs,
  lib,
  ...
}: {
  stylix = {
    # image = 

    targets.waybar.enable = false;
    targets.rofi.enable = false;
    
    cursor.name = "Bibata-Modern-Ice";
    cursor.package = pkgs.bibata-cursors;
    
    autoEnable = true;
  };
}
