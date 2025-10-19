# Google Cloud CLI

Installs Google Cloud CLI (gcloud) on Debian/Ubuntu-based containers.

## Options

| Option | Default | Description |
|--------|---------|-------------|
| `version` | `latest` | gcloud CLI version |
| `installComponents` | `""` | Additional components (comma-separated) |

## Usage

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/gcloud-cli:1": {}
  }
}
```

With additional components:

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/gcloud-cli:1": {
      "installComponents": "kubectl,docker-credential-gcr,gke-gcloud-auth-plugin"
    }
  }
}
```

## Common Components

- `kubectl` - Kubernetes CLI
- `docker-credential-gcr` - Docker credential helper for GCR
- `gke-gcloud-auth-plugin` - GKE authentication plugin
- `app-engine-python` - App Engine Python support

## Authentication

```bash
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
```
