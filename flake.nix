{
  description = "Personal macOS CLI environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";

  outputs = { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      forEachSystem = f:
        nixpkgs.lib.genAttrs systems (system:
          f (import nixpkgs {
            inherit system;
          }));
    in {
      packages = forEachSystem (pkgs: {
        cli = pkgs.buildEnv {
          name = "dotfiles-cli";
          paths = import ./nix/cli-packages.nix { inherit pkgs; };
          pathsToLink = [ "/bin" "/share" ];
        };

        default = self.packages.${pkgs.stdenv.hostPlatform.system}.cli;
      });

      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = import ./nix/cli-packages.nix { inherit pkgs; };
        };
      });

      formatter = forEachSystem (pkgs: pkgs.nixfmt);
    };
}
