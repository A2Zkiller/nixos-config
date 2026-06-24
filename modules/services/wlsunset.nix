{
  flake.services.wlsunset = {
    pkgs,
    lib,
    ...
  }: {
    systemd.user.services.wlsunset = {
      description = "Runs wlsunset";

      wantedBy = ["graphical-session.target"];
      requisite = ["graphical-session.target"];
      after = ["graphical-session.target"];

      serviceConfig = {
        Type = "simple";
        ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
        ExecStart = "${lib.getExe pkgs.wlsunset} -S 06:00 -s 20:00";
      };
    };
  };
}
