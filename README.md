# use-nix-action

![GitHub Actions badge](https://github.com/aldoborrero/use-nix-action/workflows/use-nix-action%20test/badge.svg)

This action is a composite action that combines multiple common actions when
using [`Nix`](https://nix.org) on any Github Action, minimizing the setup. Below
you can see the list of included actions:

- [cachix/install-nix-action](https://github.com/cachix/install-nix-action)
- [aldoborrero/direnv-nix-action](https://github.com/aldoborrero/direnv-nix-action)

More actions will be supported soon.

## Inputs

Specify inputs using the `with:` keyword in your workflow file.

All regular `cachix/install-nix-action` inputs are supported:

- `enable_install_nix_action`: Enables `cachix/install-nix-action`. The default
  is `true`.

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

All regular `aldoborrero/direnv-nix-action` inputs are supported:

- `enable_direnv_nix_action`: Enables `cachix/direnv-nix-action`. The default is
  `true`.

- `use_nix_profile`: Optional. Set to `true` to use the `nix profile` command
  instead of `nix-env` for installing `direnv`. The default is `false`.

- `nix_channel`: Optional. Specify the nix channel nix will use to install
  `direnv` package. The default is `nixpkgs`.

## Outputs

This action produces no outputs.

## Usage

Below is an example of how to use `use-nix-action` in a workflow:

```yaml
name: Example workflow using use-nix-action

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4

    - uses: aldoborrero/use-nix-action@v4

    # Add additional steps that utilize the environment variables or binaries sourced from direnv
```

## License

See [License](./LICENSE) for more information.
