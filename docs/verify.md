# Verifying releases

Release artifacts carry signed build provenance (Sigstore), produced in GitHub Actions.

```bash
gh attestation verify <file> --repo ZeleMate/go-live-check
```

**PyPI:** packages are uploaded with trusted publishing and carry PEP 740 attestations, visible on the PyPI file page.

**Go:** the tag is the release. Each release has binaries for Linux, macOS and Windows (amd64 and arm64) and a `SHA256SUMS` file.

```bash
sha256sum -c SHA256SUMS --ignore-missing   # after downloading a binary and SHA256SUMS
gh attestation verify go-live-check_linux_amd64 --repo ZeleMate/go-live-check
go install github.com/ZeleMate/go-live-check/go/cmd/go-live-check@<version>   # or build from source
```

Each GitHub release also has an SBOM (SPDX JSON) attached.
