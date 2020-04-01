{ config, lib, pkgs, ... }:

let
  kernelPackages = config.boot.kernelPackages;
in
  {
    imports = [
      # "${import ../utils/hardware.nix}/apple/macbook-pro/11-5"
      "${import ../utils/hardware.nix}/apple/macbook-pro"
      "${import ../utils/hardware.nix}/common/pc/laptop/ssd"
      <nixpkgs/nixos/modules/hardware/network/broadcom-43xx.nix>
    ];

    services = {
      xserver = {
        xkbVariant = "colemak";
        xkbOptions = "caps:escape";
        xrandrHeads = [{
          output = "eDP-1";
          primary = true;
          monitorConfig = ''
            DisplaySize 406 228
          '';
        }];
      };

      # USB subsystem wakes up MBP right after suspend unless we disable it.
      udev.extraRules = lib.mkDefault ''
        SUBSYSTEM=="pci", KERNEL=="0000:00:14.0", ATTR{power/wakeup}="disabled"
      '';
    };
  }
