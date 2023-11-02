# use-nix-action

![GitHub Actions badge](https://github.com/aldoborrero/use-nix-action/workflows/use-nix-action%20test/badge.svg)

This action combines two common actions when using [`Nix`](https://nix.org) on
any Github Action:

- [cachix/install-nix-action](https://github.com/cachix/install-nix-action)
- [aldoborrero/direnv-nix-action](https://github.com/aldoborrero/direnv-nix-action)

That's it!

## Inputs (specify using `with:`)

All regular `install-nix-action` inputs are supported:

- `extra_nix_config`: append to `/etc/nix/nix.conf`

- `github_access_token`: configure Nix to pull from GitHub using the given
  GitHub token. This helps work around rate limit issues. Has no effect when
  `access-tokens` is also specified in `extra_nix_config`.

- `install_url`: specify URL to install Nix from (useful for testing non-stable
  releases or pinning Nix, for example
  https://releases.nixos.org/nix/nix-2.3.7/install)

- `install_options`: additional installer flags passed to the installer script.

- `nix_path`: set `NIX_PATH` environment variable, for example
  `nixpkgs=channel:nixos-unstable`

All regular `direnv-action` inputs are supported:

- `use_nix_profile`: set which direnv version to use.

## Outputs

This action produces no outputs.

## License

See [License](./LICENSE) for more information.
