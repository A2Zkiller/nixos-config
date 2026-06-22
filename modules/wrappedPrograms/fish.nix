{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myFish = inputs.wrappers.wrappers.fish.wrap {
      inherit pkgs;

      package = pkgs.fish;

      runtimePkgs = [
        pkgs.zoxide
        pkgs.eza
        pkgs.bat
        pkgs.lazygit
        pkgs.fzf
        pkgs.carapace
        pkgs.btop
        pkgs.ripgrep
        pkgs.gnugrep
        pkgs.fzf

        self'.packages.git
        self'.packages.jujutsu
        self'.packages.myHelix
      ];

      shellAliases = {
        ls = "${lib.getExe pkgs.eza} --icons -a --group-directories-first";
        tree = "${lib.getExe pkgs.eza} --color=auto --tree";
        rg = "${lib.getExe pkgs.ripgrep}";
        lg = "${lib.getExe pkgs.lazygit}";
      };

      configFile.content = ''
        zoxide init fish --cmd cd | source

        set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
        carapace _carapace | source

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
