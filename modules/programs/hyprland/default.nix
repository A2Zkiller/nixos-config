{
  delib,
  hosts,
  ...
}:
delib.module {
  name = "programs.hyprland";

  options = {
    # programs.hyprland.enable = delib.boolOption (hosts.isDesktop);

    programs.hyprland.enable = delib.boolOption true;
  };

  nixos.ifEnabled.programs.hyprland.enable = true;
  home.ifEnabled.wayland.windowManager.hyprland.enable = true;
}
