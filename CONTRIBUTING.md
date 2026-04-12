# Contributing to Docker Robot Framework

Thank you for your interest in contributing to this project! Here are guidelines to help you get started.

## How to Contribute

### Reporting Issues

- Use the [issue templates](https://github.com/solairen/docker_robotframework/issues/new/choose) to report bugs or request features.
- Check existing issues before creating a new one to avoid duplicates.

### Submitting Changes

1. Fork the repository.
2. Create a new branch from `main` for your changes.
3. Make your changes and ensure they follow the project conventions.
4. Test your changes by building the Docker image locally:

   ```bash
   docker build . -t robotframework:test
   ```

5. Submit a pull request targeting the `main` branch.

### Pull Request Guidelines

- Keep pull requests focused on a single change.
- Provide a clear description of what the change does and why.
- Ensure the Docker image builds successfully on both `linux/amd64` and `linux/arm64` platforms.
- Update `requirements.txt` if adding or changing Python dependencies.
- Update the `README.md` if adding new features or changing usage instructions.

### Pre-commit Hooks

This project uses [pre-commit](https://pre-commit.com/) to enforce code quality checks. Install the hooks before committing:

```bash
pip install pre-commit
pre-commit install
```

The hooks include:

- Trailing whitespace and end-of-file fixes
- YAML validation
- Secret and private key detection ([gitleaks](https://github.com/gitleaks/gitleaks))
- Markdown linting
- Dockerfile linting ([hadolint](https://github.com/hadolint/hadolint))
- Branch protection (prevents direct commits to `main`/`master`)

### Dependency Updates

Dependency updates are managed by [Dependabot](https://docs.github.com/en/code-security/dependabot). If you need to update a dependency manually, edit `requirements.txt` and test the Docker build.

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md).

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).
