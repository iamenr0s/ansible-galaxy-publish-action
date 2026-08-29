Ansible Galaxy Publish Action
===============================

[![CI](https://github.com/iamenr0s/ansible-galaxy-publish-action/actions/workflows/ci.yml/badge.svg)](https://github.com/iamenr0s/ansible-galaxy-publish-action/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

This Action will import ansible roles, or build and publish ansible collections, on [galaxy-ng](https://galaxy.ansible.com). It auto-detects which one you have: if `galaxy.yml` exists at `path`, it's published as a collection (`ansible-galaxy collection build` + `publish`); otherwise `path` is ignored and the GitHub repo is imported as a role (`ansible-galaxy role import`).

> Originally created by [L3D](https://github.com/do1jlr) as [ansible-actions/ansible-galaxy-action](https://github.com/ansible-actions/ansible-galaxy-action); this fork adds collection support and is maintained by [iamenr0s](https://github.com/iamenr0s).

## Example usage
Example of ``.github/workflows/galaxy.yml``
```yaml
---
name: Galaxy-NG Roles Import

# yamllint disable-line rule:truthy
on:
  release:
    types: ['created']

jobs:
  build:
    name: Galaxy Role Importer
    runs-on: ubuntu-latest

    steps:
      - name: 'Checkout git repo'
        uses: actions/checkout@v4
        with:
          submodules: true
          fetch-depth: 0

      - name: 'Release on galaxy'
        uses: iamenr0s/ansible-galaxy-publish-action@v1
        with:
          galaxy_api_key: ${{ secrets.galaxy_api_key }}
```

You can define the described variables like this:
```yaml
[...]
        with:
          galaxy_api_key: ${{ secrets.galaxy_api_key }}
          galaxy_version: '1.2.3'
          path: './'
          galaxy_api: 'https://galaxy.ansible.com/api/'
```

## Variables

| name | default value | description |
| --- | --- | --- |
| ``galaxy_api_key`` | - | Your personal Galaxy-NG API Token |
| ``path`` | ``./`` | The location of your role or collection. (relative path). Only used for collections; roles are imported by GitHub repo. |
| ``galaxy_api`` | ``https://galaxy.ansible.com/api/`` | Ansible Galaxy API |
| ``galaxy_version`` | - | The galaxy version for galaxy-ng. Ignored for collections (version comes from ``galaxy.yml``). |
## Some Hints
+ You find your [Galaxy-NG Token](https://galaxy.ansible.com/ui/token/) on Galaxy-NG -> Collections -> API-Token. The collections token is valid for roles too.
+ You can only import new role releases on ansible-galaxy
+ The galaxy version is provided with the ``ansible-galaxy role import --branch "$galaxy_version"`` option on the galaxy import tool. The default value ``main`` as branch name.
+ Collections are detected by the presence of a ``galaxy.yml`` at ``path``; the version to publish comes from that file, not ``galaxy_version``.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to set up a local dev environment and the checks CI runs. Please also review our [Code of Conduct](CODE_OF_CONDUCT.md).

## Security

See [SECURITY.md](SECURITY.md) to report a vulnerability privately.

## License

[MIT](LICENSE)
