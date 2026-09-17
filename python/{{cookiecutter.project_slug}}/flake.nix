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

      pythonVersion = "{{ cookiecutter.python_version }}";
      versionAttr = "python" + pkgs.lib.replaceStrings [ "." ] [ "" ] pythonVersion;

      # Get the Python version dynamically from pkgs with a fallback to pkgs.python3
      pythonPkg = pkgs.${versionAttr} or pkgs.python3;
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pythonPkg
          pkgs.uv
          pkgs.pyright
          pkgs.ruff
        ];
      };
    };
}
