{ delib, ... }:
delib.module {
  name = "programs.hyprland";

  options.programs.hyprland =
    { myconfig, ... }:
    {
      enable = delib.boolOption myconfig.isDesktop;
    };

  nixos.ifEnabled.programs.hyprland.enable = true;
  home.ifEnabled.wayland.windowManager.hyprland.enable = true;
}
