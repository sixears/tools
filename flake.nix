{
  description = "useful general-purpose tools scripts";

  inputs = {
    nixpkgs.url     = github:nixos/nixpkgs/be44bf67; # nixos-22.05 2022-10-15
    flake-utils.url = github:numtide/flake-utils/c0e246b9;
    hpkgs1.url      = github:sixears/hpkgs1/r0.0.7.0;
  };

  outputs = { self, nixpkgs, flake-utils, hpkgs1 }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        hpkgs  = hpkgs1.packages.${system};
      in
        rec {
          packages = flake-utils.lib.flattenTree {
            inherit (hpkgs) rename handbrake minfo srt-adjust atreus;
          };
      }
    );
}
