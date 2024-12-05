
{ pkgs, ... }:

{
  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];

    # substituers that will be considered before the official ones(https://cache.nixos.org)
    substituters = [
      "https://cyberglot.cachix.org" 
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cyberglot.cachix.org-1:53jVwlzlYejuIUGXTqu9CwVrHMJePWcilv45dUEd6vI="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    builders-use-substitutes = true;
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
