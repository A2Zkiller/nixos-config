{inputs, ...}: {
  perSystem = {pkgs, lib, self', ...}: {
    packages.myFish = inputs.wrappers.wrappers.fish.wrap {
      inherit pkgs;

      package = pkgs.fish;

      shellAliases = {
        cat = "${lib.getExe pkgs.bat}";
        ls = "${lib.getExe pkgs.eza} --icons -a --group-directories-first";
        tree = "${lib.getExe pkgs.eza} --color=auto --tree";
        grep = "${lib.getExe pkgs.gnugrep} --color=auto";
        cd = "${lib.getExe pkgs.zoxide}";
        lg = "${lib.getExe pkgs.lazygit}";
      };
      configFile.content = ''
        ${lib.getExe pkgs.zoxide} init fish | source
      '';
    };
  };
}
