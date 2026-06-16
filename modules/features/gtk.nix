{self, inputs, ...}: {
  flake.nixosModules.gtk = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.papirus-icon-theme
      pkgs.magnetic-catppuccin-gtk
    ];

    programs.dconf = {
      enable = true;

      profiles.user.databases = [{
        settings = {
          "org/gnome/desktop/interface" = {
            gtk-theme = "Catppuccin-Mocha-Standard-Mauve-Dark";
            icon-theme = "Papirus-Dark";
            color-scheme = "prefer-dark";
          };
        }
      }];
    };
  };
}
