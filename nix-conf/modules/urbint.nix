{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    google-chrome
    zoom-us
  ];
  networking.firewall.enable = false;
  nix = {
    binaryCaches = [
      "http://nix.urbinternal.com"
    ];
    requireSignedBinaryCaches = false;
  };
  services.printing = {
    enable = true;
    drivers = [pkgs.gutenprint];
  };
}
