{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages.myNoctalia = inputs.wrappers.wrappers.noctalia-shell.wrap {
      inherit pkgs;

      package = pkgs.noctalia-shell;

      # settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;

      settings = {
        colorSchemes = {
          darkMode = true;
          predefinedScheme = "Catppuccin";
          useWallpaperColors = false;
        };

        bar = {
          outerCorners = false;

          widgets = {
            left = [
              {
                clockColor = "none";
                customFont = "";
                formatHorizontal = "h:mm AP ddd, MMM dd yyyy";
                formatVertical = "HH mm - dd MM";
                id = "Clock";
                tooltipFormat = "HH:mm";
                useCustomFont = false;
              }
            ];
          };
        };

        wallpaper.enabled = false;
        dock.enabled = false;
      };
    };
  };
}
