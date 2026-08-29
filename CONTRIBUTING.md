# Contributing

Thanks for taking the time to contribute to `ansible-galaxy-publish-action`!

## Getting started

1. Fork the repository and create your branch from `main`.
2. Build the Docker image locally:

   ```bash
   docker build -t ansible-galaxy-publish-action .
   ```

## Making changes

- Keep changes small and focused — one topic per pull request.
- Follow the existing YAML style; lint rules live in `.yamllint`.
- If you add or change an `action.yml` input, document it in `README.md`.

## Testing

There's no automated test suite; before opening a pull request run the linters
and exercise the action manually:

```bash
yamllint .
hadolint Dockerfile
python3 -m py_compile ansible_docker.py

# Run the built image with the same env vars action.yml sets, e.g.:
docker run --rm \
  -e GALAXY_API_KEY=xxx \
  -e GIT_BRANCH=main \
  -e TARGET_PATH=./ \
  -e GALAXY_API=https://galaxy.ansible.com/api/ \
  -e GITHUB_REPOSITORY=someorg/somerole \
  ansible-galaxy-publish-action
```

CI runs the same lint checks (`hadolint`, `shellcheck`, `yamllint`) on every push and
pull request — changes must keep them green.

## Submitting a pull request

1. Ensure lint checks pass locally.
2. Fill in the pull request template.
3. A maintainer will review your PR; CI must be green before merge.

## Reporting bugs and requesting features

Use the issue templates — they ask for the details (action inputs, workflow
context) needed to reproduce a problem.

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating you agree to abide by it.
