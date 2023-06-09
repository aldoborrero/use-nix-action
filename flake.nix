{
  description = "use-nix-action";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # flake-parts
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    flake-root.url = "github:srid/flake-root";

    # utils
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat.url = "github:nix-community/flake-compat";
  };

  outputs = inputs @ {
    self,
    flake-parts,
    nixpkgs,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;}
    {
      imports = [
        inputs.flake-root.flakeModule
        inputs.treefmt-nix.flakeModule
        inputs.devshell.flakeModule
      ];

      systems = ["x86_64-linux"];

      perSystem = {
        pkgs,
        config,
        lib,
        self',
        inputs',
        ...
      }: let
      in {
        treefmt.config = {
          inherit (config.flake-root) projectRootFile;
          package = pkgs.treefmt;
          flakeFormatter = true;
          flakeCheck = true;
          programs = {
            alejandra.enable = true;
            prettier.enable = true;
          };
        };

        devshells.default = {
          name = "use-nix-action";
          packages = with pkgs; [
            shellcheck
          ];
          commands = [
            {
              category = "Tools";
              name = "fmt";
              help = "Format the source tree";
              command = "nix fmt";
            }
          ];
        };
      };
    };
}
