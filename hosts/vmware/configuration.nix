{ 
  config, 
  pkgs, 
  lib,
  inputs, 
  outputs,
  system,
  myLib,
  ... 
}: 
  let hardwareConfig = 
    if builtins.pathExists ./hardware-configuration.nix then
      ./hardware-configuration.nix
    else 
      /etc/nixos/hardware-configuration.nix;
  in
{
  imports = [
    hardwareConfig
  ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  }; 

  myNixOS = {
    bundles.users.enable = true;
    bundles.general-desktop.enable = true;
    hyprland.enable = true;

    sddm.enable = true;
    
    vmware.enable = true;
    
    home-users = {
      "a2z" = {
        userConfig = ./home.nix;
	userSettings = {
          description = "Abdullah Zureikat";
          extraGroups = ["networkmanager" "wheel" "libvirtd"];
	};
      };
    };
  };

  networking.hostName = "vmware";

  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics.enable = true;
  # hardware.openrazer.enable = true;

  programs.dconf.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  xdg.portal.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11"; 
}
