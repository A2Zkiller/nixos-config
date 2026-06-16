{inputs, ...}: {
  perSystem = {pkgs, lib, self', ...}: {
    packages.myFish = inputs.wrappers.wrappers.fish.wrap {
      inherit pkgs;

      package = pkgs.fish;

      runtimePkgs = [
        pkgs.zoxide
        pkgs.eza
        pkgs.bat
        pkgs.lazygit
        pkgs.fzf

        self'.packages.git
        self'.packages.jujutsu
        self'.packages.helix
      ];

      shellAliases = {
        cat = "${lib.getExe pkgs.bat}";
        ls = "${lib.getExe pkgs.eza} --icons -a --group-directories-first";
        tree = "${lib.getExe pkgs.eza} --color=auto --tree";
        grep = "${lib.getExe pkgs.gnugrep} --color=auto";
        lg = "${lib.getExe pkgs.lazygit}";
      };

      configFile.content = ''
        zoxide init fish --cmd cd | source

        set -g fish_greeting ""
      '';

      env = {
        TERM = "xterm-256color";
        COLORTERM = "truecolor";
      };

      flags."--no-config" = false;
    };
  };
}
