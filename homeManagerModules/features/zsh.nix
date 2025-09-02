{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.myHomeManager;
in {
  home.file = {
    ".local/share/zsh/zsh-autosuggestions".source = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
    ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
    ".local/share/zsh/nix-zsh-completions".source = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
    ".local/share/zsh/zsh-vi-mode".source = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      cat = "${pkgs.bat}/bin/bat";
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      tree = "${pkgs.eza}/bin/eza --color=auto --tree";
      grep = "grep --color=auto";
      q = "exit";
      ":q" = "exit";
      cd = "z";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
	"rust"
      ];
      theme = "gnzh";
    };
  };

  programs.zoxide =  {
    enable = true;
    enableZshIntegration = true;
  };
}
