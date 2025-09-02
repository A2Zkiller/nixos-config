{pkgs, lib, ...}: let
  sddmTheme = import ./sddm-theme.nix {inherit pkgs;};
in {
  services.displayManager = {
    sddm.enable = lib.mkDefault true;
    sddm.wayland.enable = true;
    # sddm.theme = "${sddmTheme}";
    sddm.theme = "catppuccin-mocha";
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
}
