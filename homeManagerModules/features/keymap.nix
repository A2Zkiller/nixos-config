{
  pkgs,
  lib,
  ...
}:
with pkgs; let
  inherit (lib) getExe;
in {
  myHomeManager.keybinds = {
    "SUPER, d" = {
      "f".package = firefox;
      "b".package = rofi-bluetooth;
      "h".script = ''
        ${getExe kitty} -e ${getExe btop}
      '';
    };

    "SUPER, p".script = ''
      ${getExe playerctl} play-pause'';

    "SUPER CONTROL, S".script = ''
      ${getExe grim} -l 0 - | ${wl-clipboard}/bin/wl-copy'';

    "SUPER SHIFT, E".script = ''
      ${wl-clipboard}/bin/wl-paste | ${getExe swappy} -f -
    '';

    "SUPER SHIFT, S".script = ''
      ${getExe grim} -g "$(${getExe slurp} -w 0)" - \
      | ${wl-clipboard}/bin/wl-copy
    '';
  };
}
