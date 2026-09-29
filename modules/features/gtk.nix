{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gtk = {pkgs, ...}: let
    icon-theme-name = "Papirus-Dark";
    icon-package = pkgs.papirus-icon-theme;

    theme-name = "catppuccin-mocha-lavender-standard";
    theme-package = pkgs.catppuccin-gtk.override {
      variant = "mocha";
      accents = ["lavender"];
    };

    cursor-theme-name = "Bibata-Modern-Ice";
    cursor-size = "30";
    cursor-package = pkgs.bibata-cursors;

    gtk-settings = ''
      [Settings]
      gtk-icon-theme-name = ${icon-theme-name}
      gtk-theme-name = ${theme-name}
      gtk-cursor-theme-name = ${cursor-theme-name}
      gtk-cursor-theme-size = ${cursor-size}
    '';
  in {
    environment.systemPackages = [
      icon-package
      theme-package
      cursor-package

      pkgs.gtk3
      pkgs.gtk4
    ];

    environment.etc = {
      "xdg/gtk-3.0/settings.ini".text = gtk-settings;
      "xdg/gtk-4.0/settings.ini".text = gtk-settings;
    };

    environment.variables = {
      GTK_THEME = theme-name;
      QS_ICON_THEME = icon-theme-name;
      XCURSOR_THEME = cursor-theme-name;
      XCURSOR_SIZE = cursor-size;
    };

    programs.dconf = {
      enable = true;

      profiles.user.databases = [
        {
          settings = {
            "org/gnome/desktop/interface" = {
              gtk-theme = theme-name;
              icon-theme = icon-theme-name;
              color-scheme = "prefer-dark";

	      cursor-theme = cursor-theme-name;
	      cursor-size = cursor-size;
            };
          };
        }
      ];
    };
  };
}
