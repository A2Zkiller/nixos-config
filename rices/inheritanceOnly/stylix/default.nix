{
  delib,
  inputs,
  pkgs,
  ...
}:

delib.rice {
  name = "stylix";

  inheritanceOnly = true;

  home = {
    stylix =
      { myconfig, ... }:
      {
        enable = true;

        image = myconfig.rices.wallpaper;
        polarity = myconfig.rices.polarity;

        base16Scheme = myconfig.rices.base16Scheme;

        fonts = {
          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font Mono";
          };

          sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
          };

          serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
          };

          sizes = {
            applications = 12;
            terminal = 12;
            desktop = 10;
            popups = 10;
          };
        };

        cursor = {
          name = "Bibata-Modern-${if myconfig.rices.polarity == "dark" then "Ice" else "Classic"}";

          package = pkgs.bibata-cursors;
          size = 20;
        };
      };

    imports = [ inputs.stylix.homeModules.stylix ];
  };
}
