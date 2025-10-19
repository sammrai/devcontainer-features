# DevContainer Features

This repository contains DevContainer Features that can be used with VS Code Dev Containers.

## Features

### Google Cloud CLI (gcloud-cli)

Installs the Google Cloud CLI (gcloud) and related tools.

#### Usage

Add this feature to your `devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/gcloud-cli:1": {}
  }
}
```

#### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `version` | string | `latest` | Version of gcloud CLI to install. Use 'latest' for the most recent version. |
| `installComponents` | string | `""` | Comma-separated list of additional gcloud components to install (e.g., 'kubectl,docker-credential-gcr') |

#### Examples

Install with additional components:

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/gcloud-cli:1": {
      "version": "latest",
      "installComponents": "kubectl,docker-credential-gcr,gke-gcloud-auth-plugin"
    }
  }
}
```

For more details, see [src/gcloud-cli/README.md](./src/gcloud-cli/README.md).

## Development

### Repository Structure

```
.
├── .github/
│   └── workflows/
│       └── release.yml
├── src/
│   └── gcloud-cli/
│       ├── devcontainer-feature.json
│       ├── install.sh
│       └── README.md
└── README.md
```

### Publishing

Features are automatically published to GitHub Container Registry when changes are pushed to the `main` branch.

The features will be available at:
```
ghcr.io/sammrai/devcontainer-features/<feature-name>:<version>
```

## License

See individual feature directories for licensing information.
