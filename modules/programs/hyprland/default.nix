{ delib, ... }:
delib.module {
  name = "programs.hyprland";

  options =
    { myconfig, ... }:
    {
      programs.hyprland.enable = delib.boolOption (myconfig.isPC);
    };

  nixos.ifEnabled.programs.hyprland.enable = true;
  home.ifEnabled.wayland.windowManager.hyprland.enable = true;
}
