{
  delib,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "features.sddm";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    services.displayManager.sddm = {
      enable = lib.mkDefault true;
      wayland.enable = true;
      # sddm.theme = "${sddmTheme}";
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };

    environment.systemPackages = with pkgs; [
      (catppuccin-sddm.override {
        flavor = "mocha";
        font = "JetBrainsMono Nerd Font Mono";
        fontSize = "12";
        loginBackground = true;
      })

      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
    ];
  };
}
