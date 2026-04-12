
# Pull Request

Thank you for contributing! Use this template to describe your change and make it easy for reviewers to verify and merge.

## Description

- What changed? (one or two sentences)
- Why this change is needed (motivation / context)

## Type of change

- Bugfix (non-breaking change which fixes an issue)
- New feature (non-breaking change which adds functionality)
- Breaking change (fix or feature that would cause existing behavior to change)
- Documentation only

## Related issues

- Resolves / relates to: #(issue number) — link the issue if applicable

## Checklist for reviewers and CI

- [ ] Docker image builds successfully: `docker build . -t robotframework:test`
- [ ] No new warnings in build output
- [ ] Image works on both `linux/amd64` and `linux/arm64`
- [ ] `requirements.txt` updated (if dependencies changed)
- [ ] Documentation updated (README, CHANGELOG, or other relevant docs)
- [ ] Pre-commit hooks pass: `pre-commit run --all-files`

## How to test locally (Reviewer guide)

Include minimal steps so reviewers can reproduce the behavior.

1. Build the Docker image:

```bash
docker build . -t robotframework:test
```

2. Run the example test:

```bash
docker run -it --rm -v $(pwd)/tests:/robot robotframework:test -m robot example.robot
```

3. Or run a custom test:

```bash
docker run -it --rm -v /path/to/tests:/robot robotframework:test -m robot your_test.robot
```

## Backwards compatibility / Migration

- If this PR introduces breaking behavior (e.g. base image change, removed library), describe migration steps.

## Additional context / Screenshots

- Add any logs, screenshots, or other information needed to review this change.

---

Small PR checklist for contributors:
- [ ] Branch name follows project conventions
- [ ] Commit messages are clear and atomic
- [ ] PR description explains intent and testing steps
