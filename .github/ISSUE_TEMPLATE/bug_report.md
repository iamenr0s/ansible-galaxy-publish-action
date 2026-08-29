---
name: Bug report
about: Report a problem with the action
title: ''
labels: bug
assignees: ''
---

## Describe the bug

A clear and concise description of what the bug is.

## To reproduce

Workflow step and inputs used:

```yaml
- name: 'Release on galaxy'
  uses: iamenr0s/ansible-galaxy-publish-action@v1
  with:
    galaxy_api_key: ${{ secrets.galaxy_api_key }}
    path: './'
```

## Expected behavior

What you expected to happen.

## Actual behavior

What actually happened. Include the relevant Action log output:

```
paste output here
```

## Environment

- Content type (role or collection):
- `galaxy_api` used (default or self-hosted galaxy-ng):
- Action version/tag:

## Additional context

Anything else that might help.
