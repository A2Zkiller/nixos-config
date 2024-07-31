{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;
  #   base16Scheme = {
  #     base00 = "282828"; # ----
  #     base01 = "3c3836"; # ---
  #     base02 = "504945"; # --
  #     base03 = "665c54"; # -
  #     base04 = "bdae93"; # +
  #     base05 = "d5c4a1"; # ++
  #     base06 = "ebdbb2"; # +++
  #     base07 = "fbf1c7"; # ++++
  #     base08 = "fb4934"; # red
  #     base09 = "fe8019"; # orange
  #     base0A = "fabd2f"; # yellow
  #     base0B = "b8bb26"; # green
  #     base0C = "8ec07c"; # aqua/cyan
  #     base0D = "83a598"; # blue
  #     base0E = "d3869b"; # purple
  #     base0F = "d65d0e"; # brown
  #   };

    image = ./wallpaper.png;

    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
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
        terminal = 15;
        desktop = 10;
        popups = 10;
      };
    };
    
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    targets.chromium.enable = true;
    targets.grub.enable = true;
    targets.grub.useImage = true;
    targets.plymouth.enable = true;
    # targets.nixos-icons.enable = true;

    autoEnable = false;
  };
}
