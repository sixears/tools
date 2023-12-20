{
  description = "useful general-purpose tools scripts";

  inputs = {
    nixpkgs.url     = github:NixOS/nixpkgs/354184a; # master 2023-12-13
    flake-utils.url = github:numtide/flake-utils/c0e246b9;
    hpkgs1.url      = github:sixears/hpkgs1/r0.0.24.0;
#    hpkgs1.url      = "/home/martyn/src/hpkgs1";
  };

  outputs = { self, nixpkgs, flake-utils, hpkgs1 }:
    flake-utils.lib.eachSystem ["x86_64-linux"] (system:
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
