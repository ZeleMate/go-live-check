# go-live-check

Throwaway repo: live check of the template's Go support

## Development

Toolchains: Python 3.13+ with [uv](https://docs.astral.sh/uv/), Go 1.26+ with golangci-lint v2.

```bash
uvx pre-commit install        # git hooks: formatting, gitleaks, workflow linting
```

See [AGENTS.md](AGENTS.md) for the build, lint and test commands.

## Docs

- [Setup checklist](docs/SETUP.md)
- [Architecture decisions](docs/decisions/)
- [Threat model](docs/THREAT_MODEL.md)
- [Security policy](SECURITY.md)
- [Changelog](CHANGELOG.md)

## Licence

MIT. See [LICENSE](LICENSE).
