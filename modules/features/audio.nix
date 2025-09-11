{ delib, ... }:
delib.module {
  name = "features.audio";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
