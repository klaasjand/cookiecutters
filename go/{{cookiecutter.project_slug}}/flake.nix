{
  description = "{{ cookiecutter.project_name }} development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      goVersion = "{{ cookiecutter.go_version }}";
      versionAttr = "go_" + pkgs.lib.replaceStrings [ "." ] [ "_" ] goVersion;

      # Get the Go version dynamically from pkgs with a fallback to pkgs.go
      goPkg = pkgs.${versionAttr} or pkgs.go;
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          goPkg
          pkgs.gopls
          pkgs.golangci-lint
        ];
      };
    };
}
