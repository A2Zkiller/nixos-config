{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: let
    runtimeTools = pkgs.buildEnv {
      name = "myFish-runtime-tools";
      paths = [
        pkgs.zoxide
        pkgs.eza
        pkgs.bat
        pkgs.lazygit
        pkgs.fzf
        pkgs.carapace
        pkgs.btop
        pkgs.ripgrep
        pkgs.gnugrep
        pkgs.tldr
        pkgs.ncdu
        pkgs.p7zip-rar
        pkgs.file
        pkgs.fd
        pkgs.trash-cli

        pkgs.devenv

        self'.packages.git
        self'.packages.jujutsu
        self'.packages.myHelix
        self'.packages.myYazi
        self'.packages.myQalc
      ];
    };
  in {
    packages.myFish = inputs.wrappers.wrappers.fish.wrap {
      inherit pkgs;

      package = pkgs.fish;

      runtimePkgs = [runtimeTools];

      shellAliases = {
        ls = "${lib.getExe pkgs.eza} --icons -a --group-directories-first";
        tree = "${lib.getExe pkgs.eza} --color=auto --tree";
        rg = "${lib.getExe pkgs.ripgrep}";
        lg = "${lib.getExe pkgs.lazygit}";
      };

      configFile.content = ''
        # zoxide setup
        zoxide init fish | source

        # carapace setup
        set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
        carapace _carapace | source

        # yazi setup
        function y
        	set tmp (mktemp -t "yazi-cwd.XXXXXX")
        	command yazi $argv --cwd-file="$tmp"
        	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        		builtin cd -- "$cwd"
        	end
        	command rm -f -- "$tmp"
        end

        # devenv setup
        devenv hook fish | source

        # remove fish greeting
        set -g fish_greeting ""
      '';

      plugins = [
        pkgs.fishPlugins.pure
      ];

      env = {
        TERM = "xterm-256color";
        COLORTERM = "truecolor";
      };

      flags."--no-config" = false;
    };
  };
}
