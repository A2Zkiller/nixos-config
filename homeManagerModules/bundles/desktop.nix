{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
    myHomeManager = {
      rofi.enable = lib.mkDefault true;
      kitty.enable = lib.mkDefault true;
      foot.enable = lib.mkDefault true;

      gtk.enable = lib.mkDefault true;
    };

    home.file = {
      ".local/share/rofi/rofi-bluetooth".source = "${pkgs.rofi-bluetooth}";
    };

    qt.enable = true;

    services.udiskie.enable = true;

    xdg.mimeApps.defaultApplications = {
      "text/plain" = ["neovide.desktop"];
      "application/pdf" = ["zathura.desktop"];
      "image/*" = ["imv.desktop"];
      "video/png" = ["mpv.desktop"];
      "video/jpg" = ["mpv.desktop"];
      "video/*" = ["mpv.desktop"];
    };

    services.mako = {
      enable = true;
      
      settings = {
        border-radius = 5;
        border-size = 2;
        defaultimeout = 10000;
        layer = "overlay";
      };
    };

    home.packages = with pkgs; [
      feh
      noisetorch
      polkit
      polkit_gnome
      lxsession
      pulsemixer
      pavucontrol
      adwaita-qt
      pcmanfm
      libnotify

      pywal
      neovide
      ripdrag
      mpv
      sxiv
      zathura

      lm_sensors
      upower

      cm_unicode

      virt-manager

      kitty

      onlyoffice-bin
      easyeffects
      gegl
    ];
}
