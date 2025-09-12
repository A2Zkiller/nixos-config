{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.helix";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      # theme = "catppuccin"; # managed by stylix // can be forced with lib.mkForce
      editor = {
        line-number = "relative";
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.alejandra}/bin/alejandra";
          language-servers = [
            "nix-nixd"
            "nix-nil"
          ];
        }
        {
          name = "rust";
          auto-format = true;
        }
      ];
      language-server = {
        nix-nil.command = "${pkgs.nil}/bin/nil";
        nix-nixd.command = "${pkgs.nixd}/bin/nixd";
      };
    };
  };
}
