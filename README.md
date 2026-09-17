# Cookiecutter Template Projects

## Usage

On systems with Nix installed:

```sh
nix run nixpkgs#cookiecutter -- https://github.com/klaasjand/cookiecutters --directory go
```

When you cloned the cookiecutters repo locally:

```sh
nix run nixpkgs#cookiecutter -- /path/to/cookiecutters --directory go
```

After opening the folder you may need to run:

```sh
direnv allow
```

On regular systems (with uvx):

NOTE: This does not install your development environment or other requirements,
such as using these cookiecutters with Nix. You can use Mise for that.

```sh
uvx cookiecutter -- https://github.com/klaasjand/cookiecutters --directory go
```
