{delib, ...}:
delib.module {
  name = "programs.hyprland";

  options = {myconfig, ...}: {
    # programs.hyprland.enable = delib.boolOption (hosts.isDesktop);

    programs.hyprland.enable = delib.boolOption true; #myconfig.hosts.isPC;
  };

  nixos.ifEnabled.programs.hyprland.enable = true;
  home.ifEnabled.wayland.windowManager.hyprland.enable = true;
}
