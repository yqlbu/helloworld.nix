{
  description = "A very basic helloworld flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = (import nixpkgs) { inherit system; };
        packageName = "helloworld";
      in {
        # build package
        packages.${packageName} = with pkgs;
          stdenv.mkDerivation rec {
            name = packageName;
            version = "v1.0.0";
            src = self;
            buildPhase = "gcc -o ${name} ./hello.c";
            installPhase = "mkdir -p $out/bin; install -t $out/bin ${name}";
          };

        # define output packages
        packages = {
          default = self.packages.${system}.${packageName};
          vim = nixpkgs.legacyPackages.${system}.vim;
        };

        # dev environment
        devShells.default = with pkgs; mkShell {
          packages = [ cowsay vim ];
        };
      });
}

