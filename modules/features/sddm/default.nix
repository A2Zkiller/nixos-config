{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "features.sddm";

  options = delib.singleEnableOption host.isPC;

  nixos.ifEnabled = {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha-mauve";
      package = pkgs.kdePackages.sddm;
    };

    environment.systemPackages = with pkgs; [
      (catppuccin-sddm.override {
        flavor = "mocha";
        accent = "mauve";
        font = "JetBrainsMono Nerd Font Mono";
        fontSize = "12";
        loginBackground = true;
      })

      nerd-fonts.jetbrains-mono
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
    ];
  };
}
