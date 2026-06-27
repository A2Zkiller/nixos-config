{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages.myYazi = inputs.wrappers.wrappers.yazi.wrap {
      inherit pkgs;

      package = pkgs.yazi;

      flavors = {
        catppuccin-mocha = "${pkgs.fetchFromGitHub {
          owner = "yazi-rs";
          repo = "flavors";
          rev = "c02c804";
          hash = "sha256-ZXJx4iwGCAi6qqDiLSuJvX3UL6XzypxSO7ptspDD/Yw=";
        }}/catppuccin-mocha.yazi";
      };

      settings = {
        yazi = {
          mgr = {
            show_hidden = true;
            show_symlink = true;
            sort_dir_first = true;
          };
        };

        theme = {
          flavor.dark = "catppuccin-mocha";
        };
      };
    };
  };
}
