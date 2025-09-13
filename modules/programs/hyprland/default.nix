{delib, ...}:
delib.module {
  name = "programs.hyprland";

  options = {myconfig, ...}: {
    # TODO: Switch the default true option to hosts.isPC after issue 54 is resolved in denix

    programs.hyprland.enable = delib.boolOption true; #myconfig.hosts.isPC;
  };

  nixos.ifEnabled.programs.hyprland.enable = true;
  home.ifEnabled.wayland.windowManager.hyprland.enable = true;
}
