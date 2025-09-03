{
  pkgs,
  config,
  lib,
  inputs,
  osConfig,
  ...
}: let
  generalStartScript = pkgs.writeShellScriptBin "start" ''
    ${pkgs.swww}/bin/swww-daemon init &

    ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &

    # hyprctl setcursor Bibata-Modern-Ice 16 &

    systemctl --user import-environment PATH &
    systemctl --user restart xdg-desktop-portal.service &


    # wait a tiny bit for wallpaper
    sleep 2


    ${pkgs.swww}/bin/swww img ${config.stylix.image} &

    # wait for monitors to connect
    sleep 3

    # general startupScript extension
  '';

  colors = config.lib.stylix.colors;

  exec-once =
    [
      "${pkgs.swww}/bin/swww-daemon --format xrgb & ${pkgs.swww}/bin/swww img ${config.stylix.image}"

      # "hyprctl setcursor Bibata-Modern-Ice 24"
      
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    ];
in {
  imports = [
    ./keymaps.nix
  ];

    myHomeManager.waybar.enable = lib.mkDefault true;
    myHomeManager.keymap.enable = lib.mkDefault true;

    wayland.windowManager.hyprland = {
      # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      enable = true;
      settings = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = lib.mkForce "rgba(${colors.base07}ff)";
          "col.inactive_border" = lib.mkForce "rgba(${colors.base04}ff)";

          layout = "dwindle";
        };

        monitor = ",preferred,auto,1";

        env = [
          "XCURSOR_SIZE,24"
        ];

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "grp:alt_shift_toggle,caps:escape";

          kb_rules = "";

          follow_mouse = 1;

          touchpad = {
            natural_scroll = false;
          };

          repeat_rate = 40;
          repeat_delay = 250;
          force_no_accel = true;

          sensitivity = 0.0; # -1.0 - 1.0, 0 means no modification.
        };

        misc = {
          enable_swallow = true;
          force_default_wallpaper = 0;
        };

        binds = {
          movefocus_cycles_fullscreen = 0;
        };

        decoration = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 5;

          shadow = {
            enabled = true;
            range = 30;
            render_power = 3;
            color = lib.mkForce "rgba(1a1a1aee)";
          };
        };

        animations = {
          enabled = true;

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = "myBezier, 0.25, 0.9, 0.1, 1.02";

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            # "workspaces, 1, 3, default, slidevert"
            # "workspaces, 1, 3, myBezier, slidefadevert"
            "workspaces, 1, 3, myBezier, fade"
          ];
        };

        dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # you probably want this
        };

	master = {
          new_status = "master";
	};

        gestures = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = false;
        };

        "$mainMod" = "SUPER";

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind =
          [
            "$mainMod, return, exec, foot" 
            "$mainMod, Q, killactive,"
            "$mainMod SHIFT, M, exit,"
            "$mainMod SHIFT, F, togglefloating,"
            "$mainMod, F, fullscreen,"
            "$mainMod, G, togglegroup,"
            "$mainMod, bracketleft, changegroupactive, b"
            "$mainMod, bracketright, changegroupactive, f"
            "$mainMod, S, exec, rofi -show drun -show-icons"
            "$mainMod, P, pin, active"

            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

            "$mainMod, h, movefocus, l"
            "$mainMod, l, movefocus, r"
            "$mainMod, k, movefocus, u"
            "$mainMod, j, movefocus, d"

            "$mainMod SHIFT, h, movewindow, l"
            "$mainMod SHIFT, l, movewindow, r"
            "$mainMod SHIFT, k, movewindow, u"
            "$mainMod SHIFT, j, movewindow, d"
          ]
          ++ map (n: "$mainMod SHIFT, ${toString n}, movetoworkspace, ${toString (
            if n == 0
            then 10
            else n
          )}") [1 2 3 4 5 6 7 8 9 0]
          ++ map (n: "$mainMod, ${toString n}, workspace, ${toString (
            if n == 0
            then 10
            else n
          )}") [1 2 3 4 5 6 7 8 9 0];

        binde = [
          "$mainMod SHIFT, h, moveactive, -20 0"
          "$mainMod SHIFT, l, moveactive, 20 0"
          "$mainMod SHIFT, k, moveactive, 0 -20"
          "$mainMod SHIFT, j, moveactive, 0 20"

          "$mainMod CTRL, l, resizeactive, 30 0"
          "$mainMod CTRL, h, resizeactive, -30 0"
          "$mainMod CTRL, k, resizeactive, 0 -10"
          "$mainMod CTRL, j, resizeactive, 0 10"
        ];

        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

	exec-once = exec-once;
      };
    };

    home.packages = with pkgs; [
      grim
      slurp
      wl-clipboard
      
      swayimg

      swww

      networkmanagerapplet

      rofi-wayland
    ];
}
