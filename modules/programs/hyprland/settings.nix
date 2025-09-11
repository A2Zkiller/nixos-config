# TODO: Finish Hyprland Config
{ delib, config, ... }:
let
  colors = config.lib.stylix.colors;
in
delib.module {
  name = "programs.hyprland";
}
