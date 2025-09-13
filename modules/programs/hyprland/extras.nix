{delib, ...}:
delib.module {
  name = "programs.hyprland";

  # Provides Extra Features listed in hyprland's Must Have list

  nixos.ifEnabled = {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  home.ifEnabled = {
    services.mako = {
      enable = true;

      settings = {
        border-radius = 5;
        border-size = 2;
        defaultimeout = 7000;
        layer = "overlay";
      };
    };
  };
}
