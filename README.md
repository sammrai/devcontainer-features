# DevContainer Features

Collection of DevContainer features for Google Cloud and AI tools.

## Available Features

| Feature | Description | Documentation |
|---------|-------------|---------------|
| [gcloud-cli](./src/gcloud-cli) | Google Cloud CLI (gcloud) and related tools | [README](./src/gcloud-cli/README.md) |
| [gemini-cli](./src/gemini-cli) | Google Gemini CLI with Node.js and nvm | [README](./src/gemini-cli/README.md) |
| [codex-cli](./src/codex-cli) | OpenAI Codex CLI with Node.js and nvm | [README](./src/codex-cli/README.md) |

## Usage

Add features to your `.devcontainer/devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/sammrai/devcontainer-features/gcloud-cli:1": {},
    "ghcr.io/sammrai/devcontainer-features/gemini-cli:1": {},
    "ghcr.io/sammrai/devcontainer-features/codex-cli:1": {}
  }
}
```

## Platform Support

All features support Debian/Ubuntu-based containers.
