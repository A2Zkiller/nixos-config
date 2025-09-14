{
  delib,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "stylix";

  options = delib.singleEnableOption true;

  home.ifEnabled = {myconfig, ...}: {
    stylix = {
      enable = true;

      image = myconfig.constants.wallpaper;
      polarity = myconfig.constants.polarity;

      base16Scheme = myconfig.constants.base16Scheme;

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
        name = "Bibata-Modern-${
          if myconfig.constants.polarity == "dark"
          then "Ice"
          else "Classic"
        }";

        package = pkgs.bibata-cursors;
        size = 20;
      };
    };
  };

  home.always.imports = [inputs.stylix.homeModules.stylix];
}
