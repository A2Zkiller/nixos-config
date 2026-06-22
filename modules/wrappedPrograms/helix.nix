{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myHelix = inputs.wrappers.wrappers.helix.wrap {
      inherit pkgs;

      package = pkgs.helix;

      runtimePkgs = [
        pkgs.nil
        pkgs.nixd
        pkgs.alejandra

        pkgs.marksman
        pkgs.markdown-oxide

        pkgs.rust-analyzer
        pkgs.rustfmt
        pkgs.lldb
      ];

      settings = {
        theme = "catppuccin_mocha";

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
            formatter.command = "${lib.getExe pkgs.alejandra}";
            language-servers = [
              "nixd"
              "nil"
            ];
          }

          {
            name = "markdown";
            language-servers = [
              "marksman"
              "markdown-oxide"
            ];
          }

          {
            name = "rust";
            auto-format = true;
            formatter.command = "${lib.getExe pkgs.rustfmt}";
            language-servers = [
              "rust-analyzer"
            ];
          }
        ];
      };
    };
  };
}
