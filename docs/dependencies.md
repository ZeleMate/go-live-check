# Dependency policy

- **Lockfiles are committed** and CI installs from them only (`uv sync --locked`, `go.sum` (`go mod verify`, `go mod tidy -diff` in CI)).
- **Cooldown before adopting new releases.** Dependabot waits 7 days (14 for majors); security updates are not delayed. uv ignores releases newer than 7 days (`exclude-newer`).
- **Scanning:** OSV-Scanner on every PR and weekly; Dependabot alerts and malware alerts; govulncheck on the newest Go version (flags only vulnerable code that's called).
- **Go version floor:** `go.mod`'s `go` line is the floor CI's first leg tests. A dependency that needs a newer Go raises it and fails that leg; Dependabot never raises it. Move it deliberately with `copier update -d go_version=1.N`.
- **Fix timelines:** critical/high within 7 days, medium within 60 days, low at the next routine update.
- **Adding a dependency:** confirm it exists on the official registry, is maintained, has a compatible licence, and is worth its weight. Prefer the standard library.
- **Allowed licences:** MIT, Apache-2.0, BSD-2/3-Clause, ISC, Unicode-3.0, MPL-2.0 (file-level). Anything else needs an ADR.
