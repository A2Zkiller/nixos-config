{
  perSystem = {pkgs, ...}: {
    packages.open-editor-script = pkgs.writeShellApplication {
      name = "editor";
      text = ''
	eval "''${EDITOR:-nano} \"\$@\""
      '';
    };
  };
}
