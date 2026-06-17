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
      };
    };
  };
}
