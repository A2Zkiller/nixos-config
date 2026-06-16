{self, inputs, ...}: {
  flake.nixosModules.gtk = {pkgs, ...}:
    let
      icon-theme-name = "Papirus-Dark";
      theme-name = "Catppuccin-Mocha-Standard-Mauve-Dark";

      gtk-settings = ''
          [Settings]
          gtk-icon-theme-name = ${icon-theme-name}
          gtk-theme-name = ${theme-name}
        '';
    in {
    environment.systemPackages = [
      pkgs.papirus-icon-theme
      pkgs.magnetic-catppuccin-gtk

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
    };

    programs.dconf = {
      enable = true;

      profiles.user.databases = [{
        settings = {
          "org/gnome/desktop/interface" = {
            gtk-theme = theme-name;
            icon-theme = icon-theme-name;
            color-scheme = "prefer-dark";
          };
        };
      }];
    };
  };
}
