{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];
  
  stylix = {
    enable = true;

    image = ./wallpaper.png;

    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

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
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };
    
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    # targets.grub.enable = true;
    # targets.grub.useImage = true;
    # targets.plymouth.enable = true;
    # targets.nixos-icons.enable = true;

    autoEnable = true;
  };
}
