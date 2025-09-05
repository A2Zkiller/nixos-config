{delib, ...}:
delib.host {
  name = "vmware"; 

  homeManagerSystem = "x86_64-linux"; 
  home.home.stateVersion = "23.11";

  nixos = {
    nixpkgs.hostPlatform = "x86_64-linux"; 
    system.stateVersion = "23.11"; 
  };
}
