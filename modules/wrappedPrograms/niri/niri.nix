{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri = {
    pkgs,
    lib,
    config,
    ...
  }: let
    monitors = config.preferences.monitors;

    convertFormat = monitor:
      if monitor.refreshRate != null
      then "${monitor.resolution}@${monitor.refreshRate}"
      else monitor.resolution;

    monitorSettings = lib.listToAttrs (map (monitor: {
        name = monitor.name;
        value = {
          mode = convertFormat monitor;
        };
      })
      monitors);
  in {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri.wrap {
        settings.outputs = monitorSettings;
      };
    };

    environment.systemPackages = let
      selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
    in [
      selfpkgs.myNoctalia
      selfpkgs.myLibrewolf
      selfpkgs.myAlacritty
      selfpkgs.myKitty

      pkgs.wl-clipboard
    ];

    environment.variables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myNiri = inputs.wrappers.wrappers.niri.wrap {
      inherit pkgs;

      suffixVar = [
        ["XCURSOR_PATH" ":" "${pkgs.bibata-cursors}/share/icons"]
      ];

      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)

          (lib.getExe (pkgs.writeShellScriptBin "wallpaper" ''
            ${lib.getExe pkgs.swaybg} -m fill -i "${./wallpaper.jpg}"
          ''))
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        cursor = {
          xcursor-theme = "Bibata-Modern-Ice";
          xcursor-size = 30;
        };

        input.keyboard.xkb.layout = "us";

        layout = {
          gaps = 5;

          focus-ring = {
            width = 4;
            active-color = "#cba6f7";
          };
        };

        workspaces = let
          settings = _: {};
        in {
          "0" = settings;
          "1" = settings;
          "2" = settings;
          "3" = settings;
          "4" = settings;
          "5" = settings;
          "6" = settings;
          "7" = settings;
          "8" = settings;
          "9" = settings;
        };

        overview = {
          backdrop-color = "#313244";
          zoom = 0.7;
        };

        gestures = {
          hot-corners.off = _: {};
        };

        binds = {
          "Mod+Return".spawn-sh = lib.getExe self'.packages.myKitty;
          "Mod+Q".close-window = _: {};
          "Mod+Shift+Q".quit = _: {};
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
          "Mod+G".fullscreen-window = _: {};
          "Mod+M".maximize-column = _: {};
          "Mod+C".center-column = _: {};

          "Mod+V".switch-focus-between-floating-and-tiling = _: {};
          "Mod+Shift+V".toggle-window-floating = _: {};

          "Mod+F".spawn-sh = "${lib.getExe self'.packages.myLibrewolf}";
          "Mod+Shift+F".spawn-sh = "${lib.getExe self'.packages.myLibrewolf} -private-window";

          # Select region with slurp, screenshot with grim, store in clipboard
          "Print".spawn-sh = ''
            ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp})" - | \
            ${pkgs.wl-clipboard}/bin/wl-copy
          '';

          # Copy entire screen to clipboard
          "Ctrl+Print".spawn-sh = ''
            ${lib.getExe pkgs.grim} - | ${pkgs.wl-clipboard}/bin/wl-copy
          '';

          # Take clipboard and add annotations
          "Mod+Shift+E".spawn-sh = ''
            ${pkgs.wl-clipboard}/bin/wl-paste | ${lib.getExe pkgs.swappy} -f -
          '';

          "Mod+H".focus-column-left = _: {};
          "Mod+L".focus-column-right = _: {};
          "Mod+K".focus-window-or-workspace-up = _: {};
          "Mod+J".focus-window-or-workspace-down = _: {};

          "Mod+Left".focus-column-left = _: {};
          "Mod+Right".focus-column-right = _: {};
          "Mod+Up".focus-window-or-workspace-up = _: {};
          "Mod+Down".focus-window-or-workspace-down = _: {};

          "Mod+Shift+H".move-column-left = _: {};
          "Mod+Shift+L".move-column-right = _: {};
          "Mod+Shift+K".move-window-up-or-to-workspace-up = _: {};
          "Mod+Shift+J".move-window-down-or-to-workspace-down = _: {};

          "Mod+Shift+Left".move-column-left = _: {};
          "Mod+Shift+Right".move-column-right = _: {};
          "Mod+Shift+Up".move-window-up-or-to-workspace-up = _: {};
          "Mod+Shift+Down".move-window-down-or-to-workspace-down = _: {};

          "Mod+BracketLeft".consume-or-expel-window-left = _: {};
          "Mod+BracketRight".consume-or-expel-window-right = _: {};

          "Mod+Ctrl+H".set-column-width = "-5%";
          "Mod+Ctrl+L".set-column-width = "+5%";
          "Mod+Ctrl+J".set-window-height = "+5%";
          "Mod+Ctrl+K".set-window-height = "-5%";

          "Mod+Ctrl+Left".set-column-width = "-5%";
          "Mod+Ctrl+Right".set-column-width = "+5%";
          "Mod+Ctrl+Down".set-window-height = "+5%";
          "Mod+Ctrl+Up".set-window-height = "-5%";

          "Mod+1".focus-workspace = "0";
          "Mod+2".focus-workspace = "1";
          "Mod+3".focus-workspace = "2";
          "Mod+4".focus-workspace = "3";
          "Mod+5".focus-workspace = "4";
          "Mod+6".focus-workspace = "5";
          "Mod+7".focus-workspace = "6";
          "Mod+8".focus-workspace = "7";
          "Mod+9".focus-workspace = "8";
          "Mod+0".focus-workspace = "9";

          "Mod+Shift+1".move-column-to-workspace = "0";
          "Mod+Shift+2".move-column-to-workspace = "1";
          "Mod+Shift+3".move-column-to-workspace = "2";
          "Mod+Shift+4".move-column-to-workspace = "3";
          "Mod+Shift+5".move-column-to-workspace = "4";
          "Mod+Shift+6".move-column-to-workspace = "5";
          "Mod+Shift+7".move-column-to-workspace = "6";
          "Mod+Shift+8".move-column-to-workspace = "7";
          "Mod+Shift+9".move-column-to-workspace = "8";
          "Mod+Shift+0".move-column-to-workspace = "9";

          "Mod+O".toggle-overview = _: {};
        };
      };
    };
  };
}
