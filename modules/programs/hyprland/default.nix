{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.hyprland";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.programs.hyprland.enable = true;
  home.ifEnabled.wayland.windowManager.hyprland.enable = true;
}
