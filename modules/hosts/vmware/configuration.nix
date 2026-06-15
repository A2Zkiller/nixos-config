{self, inputs, getSystem, ...}: {
  flake.nixosModules.myVmwareConfiguration = { config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      self.nixosModules.myVmwareHardware
      self.nixosModules.niri
      self.nixosModules.vmwareGuestAdditions
      self.nixosModules.lix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "vmware"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
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

  services.displayManager.ly.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."a2z" = {
    isNormalUser = true;
    description = "a2z";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    helix
    (getSystem pkgs.stdenv.hostPlatform.system).packages.git
    lazygit
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05"; # Did you read the comment?
};
}
