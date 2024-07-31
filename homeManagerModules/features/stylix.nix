{
  pkgs,
  lib,
  ...
}: {
  stylix = {
    enable = true;

    # image = 

    targets.waybar.enable = false;
    targets.rofi.enable = false;
    
    autoEnable = true;
  };
}
