{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.zsh";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs = {
    zsh = {
      enable = true;
      shellAliases = {
        cat = "${pkgs.bat}/bin/bat";
        ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
        tree = "${pkgs.eza}/bin/eza --color=auto --tree";
        grep = "grep --color=auto";
        cd = "z";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "rust"
        ];
        theme = "";
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
