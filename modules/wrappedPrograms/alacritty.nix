{inputs, ...}: {
  perSystem = {pkgs, lib, self', ...}: {
    packages.myAlacritty = inputs.wrappers.wrappers.alacritty.wrap {
      inherit pkgs;

      package = pkgs.alacritty;

      settings = {
        terminal.shell = lib.getExe self'.packages.myFish;

        font = {
          normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
          };

          bold = {
            family = "JetBrainsMono Nerd Font";
            style = "Bold";
          };

          italic = {
            family = "JetBrainsMono Nerd Font";
            style = "Italic";
          };

          size = 12.0;
        };
      };
    };
  };
}
