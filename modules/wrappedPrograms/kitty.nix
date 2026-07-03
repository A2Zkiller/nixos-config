{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myKitty = inputs.wrappers.wrappers.kitty.wrap {
      inherit pkgs;

      package = pkgs.kitty;

      settings = {
        shell = lib.getExe self'.packages.myFish;
        editor = lib.mkDefault (lib.getExe self'.packages.myHelix);

        hide_window_decorations = "yes";
        enable_audio_bell = "no";

        window_padding_width = 10;
      };

      keybindings = {
        "ctrl+n" = "new_os_window_with_cwd";
      };

      font = {
        name = "JetBrainsMono Nerd Font";
        size = 12;
      };

      themeFile = "Catppuccin-Mocha";
    };
  };
}
